try
	revealDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealDocument()
	tell application "OmniOutliner"
		set theDocument to document 1
		set theFile to theDocument's file
	end tell
	tell application "Finder"
		reveal theFile
		activate
	end tell
end revealDocument
