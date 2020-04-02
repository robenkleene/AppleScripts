try
	doIt()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on doIt()
	tell application "Finder"
		set thePath to POSIX file "/Users/Shared/Public/"
		set theWindow to make new Finder window with properties {current view:icon view, toolbar visible:false} to item thePath
		set theWindow's current view to icon view
		set theWindow's toolbar visible to false
		
		set theWindowWidth to 400
		set theWindowHeight to 400
		set theScreenSize to bounds of window of desktop
		set theScreenWidth to item 3 of theScreenSize
		set theScreenHeight to item 4 of theScreenSize
		set theWindowX to (theScreenWidth - theWindowWidth) / 2
		set theWindowY to (theScreenHeight - theWindowHeight) / 2
		set bounds of theWindow to {theWindowX, theWindowY, theWindowX + theWindowWidth, theWindowY + theWindowHeight}
		activate
	end tell
end doIt
