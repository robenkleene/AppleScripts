openDirectory()

on openDirectory()
	set theCommand to "open ~/Library/Application\\ Support/Code/Backups"
	do shell script theCommand
end openDirectory
