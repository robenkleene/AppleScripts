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
			delay 0.5 -- Delay because of a bug, try removing later
			tell current session of theWindow
				write text "cd " & the quoted form of thePath
				activate
			end tell
		end tell
	end tell
end openInTerminal

on getThePath()
	try
		tell application "Finder"
			set theFolderAlias to target of front window as alias
			set theFolderPath to POSIX path of theFolderAlias
		end tell
	on error
		set theFolderPath to "~"
	end try
	return theFolderPath
end getThePath
