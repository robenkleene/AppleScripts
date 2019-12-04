try
	set the clipboard to getSource()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on getSource()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			return source of document 1
		end tell
	else
		tell application "Safari"
			return source of document 1
		end tell
	end if
end getSource
