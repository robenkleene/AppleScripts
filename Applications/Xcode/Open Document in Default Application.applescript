try
	openDocumentInDefaultApplication()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openDocumentInDefaultApplication()
	tell application "Xcode"
		set theDocument to document 1 whose name ends with (word -1 of (get name of window 1))
		set thePath to the path of theDocument
	end tell
	set theFile to POSIX file thePath
	tell application "Finder"
		open theFile
	end tell
end openDocumentInDefaultApplication
