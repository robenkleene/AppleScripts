try
	openURLInBrave()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openURLInBrave()
	tell application "Safari"
		set theTab to current tab of window 1
		set theURL to URL of theTab
		close theTab
	end tell
	tell application "Google Chrome"
		make new window
		open location theURL
		activate
	end tell
end openURLInBrave
