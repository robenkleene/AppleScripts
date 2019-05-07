try
	copyFilePaths()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyFilePaths()
	tell application "Finder"
		set theSelection to get selection as alias list
		set thePaths to ""
		if theSelection is {} then
			set thePaths to POSIX path of (target of front window as alias)
		else
			repeat with theAlias in theSelection
				set thePath to POSIX path of theAlias
				if thePaths as string is equal to "" then
					set thePaths to thePath
				else
					set thePaths to thePaths & "
" & thePath
				end if
			end repeat
		end if
		
		set the clipboard to thePaths
	end tell
end copyFilePaths


