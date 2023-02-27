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
		set thePaths to ""
		if theSelection is {} then
			set thePath to POSIX path of (target of front window as alias)
			do shell script "~/.bin/z_add " & the quoted form of thePath
		else
			repeat with theAlias in theSelection
				set thePath to POSIX path of theAlias
				do shell script "~/.bin/z_add " & the quoted form of thePath
			end repeat
		end if
	end tell
end copyFilePaths
