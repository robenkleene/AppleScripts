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
	end tell
	tell application "Visual Studio Code"
		activate
		repeat with theFile in theSelection
			open theFile
		end repeat
	end tell
end copyFilePaths
