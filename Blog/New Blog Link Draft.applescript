try
	makeNewPost()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewPost()
	set theDialog to display dialog "Title" default answer "" with title "New Jekyll Draft"
	set theTitle to text returned of theDialog
	set theFilePath to do shell script "~/.bin/jekyll_new_draft -l -t " & the quoted form of theTitle
	do shell script "open " & the quoted form of theFilePath
end makeNewPost
