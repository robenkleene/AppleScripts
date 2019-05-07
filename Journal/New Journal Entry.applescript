try
	makeNewPost()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewPost()
	set theFilePath to do shell script "~/.bin/journal_new_make ~/Dropbox/Text/Journal"
	do shell script "open " & the quoted form of theFilePath
end makeNewPost

