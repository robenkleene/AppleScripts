try
	openInTerminal()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openInTerminal()
	set thePath to my getThePath()
	tell application "iTerm"
		set theWindow to (create window with default profile)
		tell theWindow
			delay 0.1 -- Delay because of a bug, try removing later
			tell current session of theWindow
				write text "cd " & the quoted form of thePath
				activate
			end tell
		end tell
	end tell
end openInTerminal

on getThePath()
	tell application "iA Writer"
		set theFile to file of document 1
	end tell
	set thePath to quoted form of theFile's POSIX path
	set theDirectoryPath to do shell script "dirname " & thePath
	return theDirectoryPath
end getThePath

