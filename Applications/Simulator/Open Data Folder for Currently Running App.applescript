try
	openDataFolder()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openDataFolder()
	set theProcess to do shell script "ps ax | grep -E \"/.*Library/Developer/CoreSimulator/Devices/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}/.*/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}\" | grep -v grep | awk '{ print $1 }'"
	set thePath to do shell script "lsof -p " & theProcess & " | grep -oE \"/.*Library/Developer/CoreSimulator/Devices/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}/data/Containers/Data/Application/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}\" | grep -v grep | awk '{ print $1 }' | head -n 1"
	if thePath is equal to "" then
		set thePath to do shell script "lsof -p " & theProcess & " | grep -oE \"/.*Library/Developer/CoreSimulator/Devices/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}/\" | grep -v grep | awk '{ print $1 }' | head -n 1"
	end if
	do shell script "open " & thePath
end openDataFolder
