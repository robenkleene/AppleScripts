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
	set theFilePath to do shell script "~/.bin/markdown_temp"
	do shell script "open " & the quoted form of theFilePath
end makeNewDocument
