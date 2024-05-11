try
	doIt()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on doIt()
        tell application "Safari"
                set theURL to URL of front document as string
        end tell
	set the clipboard to theURL
end doIt
