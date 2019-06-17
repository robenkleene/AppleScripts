try
	onFunction()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on onFunction()
	tell application "BBEdit"
		set theFile to file of document 1
		set thePath to the POSIX path of theFile
		set the clipboard to thePath
	end tell
end onFunction
