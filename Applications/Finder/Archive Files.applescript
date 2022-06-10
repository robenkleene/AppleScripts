try
	copyFilePaths()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyFilePaths()
	tell application "Finder"
		set theSelection to get selection as alias list
		if theSelection is {} then
			set thePaths to POSIX path of (target of front window as alias)
		else
			repeat with theAlias in theSelection
				set theUnixPath to POSIX path of theAlias
				set theResult to do shell script "~/.bin/backup_file " & the quoted form of the theUnixPath
				display notification theResult with title "Archive File"
			end repeat
		end if
	end tell
end copyFilePaths
