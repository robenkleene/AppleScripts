try
	do()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on do()
	set theClipboard to the clipboard
	set theEditedClipboard to paragraphs 1 thru -2 of theClipboard as string
	set theEditedClipboard to text 1 thru -2 of theEditedClipboard as string
	set theEditedClipboard to text 2 thru -1 of theEditedClipboard as string
	set the clipboard to theEditedClipboard
end do
