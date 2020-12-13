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
	tell application "System Events"
		if application process "Terminal" exists then
			tell application "Terminal"
				set theWindow to do script ""
				do script "cd " & quoted form of thePath in theWindow
				activate
			end tell
		else if application process "iTerm2" exists then
			tell application "iTerm"
				set theWindow to (create window with default profile)
				tell theWindow
					tell current session of theWindow
						write text "cd " & the quoted form of thePath
						activate
					end tell
				end tell
			end tell
		end if
	end tell
end openInTerminal

on getThePath()
	tell application "Xcode"
		set theDocument to document 1 whose name ends with (word -1 of (get name of window 1))
	end tell
	set theDirectory to the «class ppth» of theDocument
	set thePath to quoted form of theDirectory
	set theDirectoryPath to do shell script "dirname " & thePath
	return theDirectoryPath
end getThePath
