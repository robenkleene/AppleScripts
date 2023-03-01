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
		set theFolderAlias to target of front window as alias as string
		set theFolderPath to POSIX path of theFolderAlias
		do shell script "~/.bin/z_add " & the quoted form of theFolderPath
	end tell
end copyFilePaths
