try
	processMarkdownLinks()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on processMarkdownLinks()
	tell application "Brave Browser"
		set theTitle to title of active tab of window 1 as string
		set theURL to the URL of active tab of window 1 as string
	end tell
	set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
	set the clipboard to theLink
	do shell script "/bin/echo -n " & the quoted form of theLink & " >> \"$HOME/Documents/Text/Scripts/Links.md\""
end processMarkdownLinks
