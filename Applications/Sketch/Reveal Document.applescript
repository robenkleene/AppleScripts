try
	revealDocument()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on revealDocument()
	tell application "Sketch"
		set thePath to «class ppth» of document 1
	end tell
	tell application "Finder"
		reveal POSIX file thePath as text
		activate
	end tell
end revealDocument
