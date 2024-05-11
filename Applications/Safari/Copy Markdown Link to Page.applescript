try
	copyMarkdownLinks()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyMarkdownLinks()
	tell application "Safari"
		set theTitle to name of front document as string
		set theURL to URL of front document as string
	end tell
	set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
	set the clipboard to theLink
end copyMarkdownLinks
