try
	revealDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealDocument()
	tell application "Sketch"
		set thePath to path of document 1
	end tell
	tell application "Finder"
		reveal POSIX file thePath as text
		activate
	end tell
end revealDocument
