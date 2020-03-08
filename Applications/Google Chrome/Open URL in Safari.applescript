try
	openURLInSafari()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openURLInSafari()
	tell application "Google Chrome"
		set theURL to URL of active tab of window 1
	end tell
	tell application "Safari"
		open location theURL
		activate
	end tell
end openURLInSafari
