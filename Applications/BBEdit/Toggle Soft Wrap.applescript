tell application "BBEdit"
	tell window 1
		if not (soft wrap text) then
			set soft wrap text to true
			set soft wrap mode to page guide
			set show page guide to true
		else if (soft wrap mode is page guide) then
			set soft wrap mode to window width
			set show page guide to false
		else
			set soft wrap text to false
		end if
	end tell
end tell

