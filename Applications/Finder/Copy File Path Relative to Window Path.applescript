try
	getThePaths()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on getThePaths()
	tell application "Finder"
		set theRootPathAlias to target of front window as alias
		set theRootPath to POSIX path of theRootPathAlias
		set theRootPathString to theRootPath as string
		set theSelection to get selection as alias list
		set thePaths to ""
		if theSelection is {} then
			set thePaths to POSIX path of (target of front window as alias)
		else
			repeat with theAlias in theSelection
				set thePathAlias to POSIX path of theAlias
				set thePathString to thePathAlias as string
				set theLength to (length of theRootPathString) + 1 -- Add one for the leading slash
				set thePath to text theLength thru -1 of thePathString
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
end getThePaths
