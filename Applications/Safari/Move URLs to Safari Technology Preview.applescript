try
	openURLsInSTP()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openURLsInSTP()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theURLs to the URL of every tab of window 1
			close window 1
		end tell
		tell application "Safari"
			activate
			set theURL to the first item of theURLs
			set theDocument to make new document with properties {URL:theURL}
			repeat with theURL in rest of the theURLs
				tell window 1 to make new tab with properties {URL:theURL}
			end repeat
		end tell
	else
		tell application "Safari"
			set theURLs to the URL of every tab of window 1
			close window 1
		end tell
		tell application "Safari Technology Preview"
			activate
			set theURL to the first item of theURLs
			set theDocument to make new document with properties {URL:theURL}
			repeat with theURL in rest of the theURLs
				tell window 1 to make new tab with properties {URL:theURL}
			end repeat
		end tell
	end if
end openURLsInSTP
