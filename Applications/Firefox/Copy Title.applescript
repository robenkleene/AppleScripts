tell application "Firefox"
	set theTitle to name of front window as string
	set the clipboard to theTitle
end tell
