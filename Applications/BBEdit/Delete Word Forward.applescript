tell application "BBEdit"
	find "\\s*\\w*\\b" searching in text of front text window options {search mode:grep, wrap around:false, backwards:false, extend selection:true} with selecting match
	set selection of front text window to grep substitution of ""
end tell
