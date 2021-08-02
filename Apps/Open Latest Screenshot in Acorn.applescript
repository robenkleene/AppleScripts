tell application "Finder"
	set screenshots to every file of desktop whose name extension is "png"
	set screenshot to item 1 of reverse of (sort screenshots by creation date)
	tell application "Acorn" to open screenshot
end tell
