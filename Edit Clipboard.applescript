try
	editClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on editClipboard()
	set theDialog to display dialog "Clipboard" default answer (the clipboard as text) with title "Clipboard"
	set theResult to text returned of theDialog
	set the clipboard to the result
end editClipboard

