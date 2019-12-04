try
	makeNewProject()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewProject()
	tell application "Finder"
		set thePathAlias to target of front window as alias
		set thePath to POSIX path of thePathAlias
		set theDialog to display dialog "Title" default answer "" with title "New Slug Project"
		set theTitle to text returned of theDialog
		set theFilePath to do shell script "~/.bin/slug_project " & the quoted form of theTitle & " " & thePath
	end tell
end makeNewProject
