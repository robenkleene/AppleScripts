openPlayground()

on openPlayground()
	set theFilePath to ((path to home folder) as string) & "Documents:Projects:Playgrounds:Playground OS X.playground"
	set thePOSIXPath to the POSIX path of theFilePath
	set theCommand to "open " & quoted form of thePOSIXPath
	do shell script theCommand
end openPlayground


