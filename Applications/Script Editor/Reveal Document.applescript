try
	revealDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealDocument()
	tell application "Script Editor"
		set theDocument to document 1
		set thePath to theDocument's path
	end tell
	set theFile to POSIX file thePath
	tell application "Finder"
		reveal theFile
		activate
	end tell
end revealDocument
