try
	makeNewPost()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewPost()
	set theFilePath to do shell script "~/.bin/journal_new ~/Dropbox/Text/Writing"
	do shell script "open " & the quoted form of theFilePath
end makeNewPost

