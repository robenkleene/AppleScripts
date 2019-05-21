if application "Safari" is running then
	tell application "Safari"
		set sameURL to URL of current tab of front window
		set URL of current tab of front window to sameURL
	end tell
end if
