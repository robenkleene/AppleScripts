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
			set theTab to current tab of window 1
			set theURL to URL of theTab
			close theTab
		end tell
	else
		tell application "Safari"
			set theTab to current tab of window 1
			set theURL to URL of theTab
			close theTab
		end tell
	end if
	tell application "Google Chrome"
		make new window
		open location theURL
		activate
	end tell
end openURLInBrave
