try
	tell application "Finder"
		reveal target of front window
	end tell
on error eStr number eNum
	do shell script "open ~/Desktop/"
end try
