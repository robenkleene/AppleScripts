tell application "QuickTime Player"
	set theDocument to document 1
	if theDocument is playing then
		tell theDocument to pause
	end if
end tell
tell application "iTunes"
	pause
end tell
