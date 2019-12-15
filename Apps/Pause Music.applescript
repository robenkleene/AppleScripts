tell application "QuickTime Player"
	if it is running then
		if (count of documents) is greater than 0 then
			set theDocument to document 1
			if theDocument is playing then
				tell theDocument to pause
			end if
		end if
	end if
end tell
tell application "Music"
	if it is running then
		pause
	end if
end tell
