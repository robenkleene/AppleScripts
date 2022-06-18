try
	openMarkdownNote()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openMarkdownNote()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	else
		tell application "Safari"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	end if
	set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
	set thePathComponent to theTitle & ".md&text=" & theLink
	-- set theEncodedPathComponent to do shell script ¬
	"perl -MURI::Escape -lne 'print uri_escape($_)' <<<" & quoted form of (thePathComponent)
	-- open location "ia-writer://new?path=/Locations/Notes/Links/" & theEncodedPathComponent
	open location "ia-writer://new?path=/Locations/Notes/Bucket/" & theTitle & ".md&text=" & theLink
end openMarkdownNote
