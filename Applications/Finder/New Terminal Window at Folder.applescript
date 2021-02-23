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

		if exists (processes where name is "Terminal") then
			tell application "Terminal"
				set theWindow to do script ""
				do script "cd " & quoted form of thePath in theWindow
				activate
			end tell
		else if exists (processes where name is "iTerm2") then
			tell application "iTerm2"
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
