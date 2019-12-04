try
	editClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on editClipboard()
	activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
	set theDialog to display dialog "Clipboard" default answer (the clipboard as text) with title "Clipboard"
	set theResult to text returned of theDialog
	set the clipboard to the result
end editClipboard
