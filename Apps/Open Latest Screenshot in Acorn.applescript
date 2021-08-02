try
	openScreenshot()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openScreenshot()
	tell application "Finder"
		set screenshots to every file of desktop whose name extension is "png"
		set screenshot to item 1 of reverse of (sort screenshots by creation date)
		tell application "Acorn" to open screenshot
	end tell
end openScreenshot
