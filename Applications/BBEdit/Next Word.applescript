tell application "BBEdit"
	find "[^\\s]\\n|(\\s[^\\s])" searching in (text 1 of window 1) options {search mode:grep, starting at top:false, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	select insertion point before (last character of found object of result)
end tell
