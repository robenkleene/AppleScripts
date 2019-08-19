tell application "QuickTime Player"
	if (count of documents) is greater than 0 then
		set theDocument to document 1
		if theDocument is playing then
			tell theDocument to pause
		end if
	end if
end tell
tell application "iTunes"
	pause
end tell
