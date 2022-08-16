try
	copyFilePaths()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyFilePaths()
	-- tell application "Finder" to set theLocation to target of window 1
	tell application "Finder" to set theLocation to insertion location as alias
	tell application "kitty" to open theLocation
end copyFilePaths
