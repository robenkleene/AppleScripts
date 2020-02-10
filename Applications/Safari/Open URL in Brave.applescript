try
	openURLInBrave()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openURLInBrave()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theURL to URL of current tab of window 1
		end tell
	else
		tell application "Safari"
			set theURL to URL of current tab of window 1
		end tell
	end if
	tell application "Brave Browser"
		make new window
		open location theURL
		activate
	end tell
end openURLInBrave
