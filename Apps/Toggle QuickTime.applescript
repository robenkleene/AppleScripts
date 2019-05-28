tell application "QuickTime Player"
	set theDocument to document 1
	if theDocument is playing then
		tell theDocument to pause
	else
		tell theDocument to play
	end if
end tell
