try
	revealFrontMostFile()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealFrontMostFile()
	tell application "BBEdit"
		set theFile to file of document 1
	end tell
	tell application "Finder"
		reveal theFile
		activate
	end tell
end revealFrontMostFile
