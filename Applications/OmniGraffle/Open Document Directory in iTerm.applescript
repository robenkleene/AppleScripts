try
	openInTerminal()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
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
	tell application "OmniGraffle"
		set theDocument to document 1
	end tell
	set theDirectory to the «class ppth» of theDocument
	set thePath to quoted form of theDirectory
	set theDirectoryPath to do shell script "dirname " & thePath
	return theDirectoryPath
end getThePath
