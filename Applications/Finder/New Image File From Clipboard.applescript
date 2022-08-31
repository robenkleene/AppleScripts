try
	makeNewFile()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeNewFile()
	set theNewFileScript to "~/.bin/file_new -p -i -r"
	tell application "Finder"
		try
			set the theFolder to (folder of the front window) as alias
		on error
			set the theFolder to path to desktop folder as alias
		end try
		
		set theUnixPath to POSIX path of theFolder
		set theNewFilePath to do shell script theNewFileScript & " \"" & theUnixPath & "\""
		
		try
			set theFileDescriptor to open for access theNewFilePath with write permission
			set eof of theFileDescriptor to 0
			
			set theImage to the clipboard as «class PNGf»
			write theImage to theFileDescriptor
			close access theFileDescriptor
			
			set theNewFilePath to theFile as string
			reveal theNewFilePath
		on error
			try
				close access theNewFilePath
			end try
		end try
	end tell
end makeNewFile
