try
	makeNewFile()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewFile()
	set theNewFileScript to "~/.bin/file_new"
	tell application "Finder"
		try
			set the theFolder to (folder of the front window) as alias
		on error
			set the theFolder to path to desktop folder as alias
		end try
		
		set theUnixPath to POSIX path of theFolder
		set theNewFilePath to do shell script theNewFileScript & " \"" & theUnixPath & "\""
		
		set theNewFilePath to POSIX file theNewFilePath as string
		reveal theNewFilePath
	end tell
end makeNewFile
