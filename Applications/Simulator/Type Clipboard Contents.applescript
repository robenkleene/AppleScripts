try
	typeClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on typeClipboard()
	set theClipboard to the clipboard as text
	tell application "System Events" to keystroke theClipboard
end typeClipboard

