openDirectory()

on openDirectory()
	set theFilePath to ((path to home folder) as string) & "Documents:Max 9:Max for Live Devices:"
	set thePOSIXPath to the POSIX path of theFilePath
	set theCommand to "open " & quoted form of thePOSIXPath
	do shell script theCommand
end openDirectory
