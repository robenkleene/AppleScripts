if application "Visual Studio Code - Insiders" is frontmost then
	do shell script "/usr/local/bin/code-insiders --new-window ~/Library/Application\\ Support/Code\\ -\\ Insiders/User"
else
	do shell script "/usr/local/bin/code --new-window ~/Library/Application\\ Support/Code/User"
end if
