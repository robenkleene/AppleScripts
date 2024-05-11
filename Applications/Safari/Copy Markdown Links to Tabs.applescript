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
		set theTitles to the name of every tab of window 1
		set theURLs to the URL of every tab of window 1
	end tell
	set theResult to ""
	repeat with theIndex from 1 to count of theURLs
		set theTitle to item theIndex of theTitles
		set theURL to item theIndex of theURLs
		set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
		set theResult to theResult & "- " & theLink & "
"
	end repeat
	set the clipboard to theResult
end copyMarkdownLinks
