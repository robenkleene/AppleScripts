try
	makeNewDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewDocument()
	activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
	set theDialog to display dialog "Title" default answer "" with title "New Inbox Document"
	set theTitle to text returned of theDialog
	
	set theFilePath to do shell script "~/.bin/markdown_new_file " & the quoted form of theTitle & " ~/Documents/Text/Projects/"
	do shell script "open " & the quoted form of theFilePath
end makeNewDocument
