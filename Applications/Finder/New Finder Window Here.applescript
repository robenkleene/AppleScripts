try
	tell application "Finder"
		make new Finder window to target of front window as alias
	end tell
on error eStr number eNum
	do shell script "open ~/Desktop/"
end try
