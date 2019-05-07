try
	set the clipboard to getSource()
on error errMsg number errNum
	if errNum is not equal to -128 then
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

