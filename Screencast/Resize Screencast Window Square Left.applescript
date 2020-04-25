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
	tell application "System Events"
		set theFrontmostProcess to first process where it is frontmost
		set theWindow to window 1 of theFrontmostProcess
		set theWindowWidth to 700
		set theWindowHeight to 700
		tell application "Finder" to set theScreenSize to bounds of window of desktop
		set theScreenWidth to item 3 of theScreenSize
		set theScreenHeight to item 4 of theScreenSize
		set theWindowX to (theScreenWidth / 2 - theWindowWidth) / 2
		set theWindowY to (theScreenHeight - theWindowHeight) / 2
		set theWindow's position to {theWindowX, theWindowY}
		set theWindow's size to {theWindowWidth, theWindowHeight}
	end tell
end doIt
