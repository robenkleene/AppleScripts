try
	makeNewDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewDocument()
	set theDialog to display dialog "Title" default answer "" with title "New Inbox Document"
	set theTitle to text returned of theDialog
	
	set theFilePath to do shell script "~/.bin/markdown_new_file " & the quoted form of theTitle & " ~/Dropbox/Work/Dow\\ Jones/Text/Inbox/"
	do shell script "open " & the quoted form of theFilePath
end makeNewDocument


