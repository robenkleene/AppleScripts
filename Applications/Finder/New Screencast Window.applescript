tell application "Finder"
	set thePath to POSIX file "/Users/Shared/Public/"
	set theWindow to make new Finder window with properties {current view:icon view, toolbar visible:false} to item thePath
	set theWindow's current view to icon view
	set theWindow's toolbar visible to false
end tell
