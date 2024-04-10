openFile()

on openFile()
	set theFilePath to ((path to home folder) as string) & "Developer:Settings:Apps:Cinema 4D:robenkleene.l4d"
	set thePOSIXPath to the POSIX path of theFilePath
	set theCommand to "open " & quoted form of thePOSIXPath
	do shell script theCommand
end openFile
