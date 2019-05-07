try
	makeNewPost()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewPost()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
			set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
		end tell
	else
		tell application "Safari"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
			set theLink to "[" & theTitle & "]" & "(" & theURL & ")"
		end tell
	end if
	set theDialog to display dialog "Title" default answer "" with title "New Jekyll Draft"
	set theTitle to text returned of theDialog
	set theFilePath to do shell script "echo " & the quoted form of theLink & " | ~/.bin/jekyll_new_draft -l -t " & the quoted form of theTitle
	do shell script "open " & the quoted form of theFilePath
end makeNewPost
