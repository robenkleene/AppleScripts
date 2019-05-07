try
	revealFrontMostFile()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealFrontMostFile()
	tell application "iA Writer"
		set theFile to file of document 1
	end tell
	tell application "Finder"
		activate
		set theContainer to container of (theFile as alias)
		make new Finder window to theContainer
		reveal theFile
	end tell
end revealFrontMostFile

