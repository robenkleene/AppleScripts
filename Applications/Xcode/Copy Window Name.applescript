try
	copyWindowNameToClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyWindowNameToClipboard()
	tell application "Xcode"
		set theName to name of window 1
		set the clipboard to theName
	end tell
end copyWindowNameToClipboard
