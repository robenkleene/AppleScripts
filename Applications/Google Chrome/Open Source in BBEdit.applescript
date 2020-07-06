try
	getSource()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on getSource()
	tell application "Google Chrome"
		set theURL to URL of active tab of window 1 as string
	end tell
	set theCommand to "/usr/local/bin/bbedit"
	do shell script "curl " & the quoted form of the theURL & " | " & theCommand
end getSource
