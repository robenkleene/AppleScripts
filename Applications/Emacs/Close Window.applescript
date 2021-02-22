try
	closeWindow()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on closeWindow()
	tell application "System Events" to activate
	tell application "Emacs"
		set shouldActivate to (count of windows) > 1
		close window 1
		if shouldActivate then
			activate
		end if
	end tell
end closeWindow
