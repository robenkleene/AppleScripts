try
	makePost()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makePost()
	tell application "iA Writer"
		set theFile to file of document 1
	end tell
	set theFilePath to quoted form of theFile's POSIX path
	set thePost to do shell script "~/.bin/jekyll_new_draft -f " & theFilePath
	do shell script "open " & the quoted form of thePost
end makePost
