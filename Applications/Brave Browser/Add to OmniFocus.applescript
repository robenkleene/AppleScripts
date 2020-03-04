try
	do()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on do()
	tell application "Brave Browser"
		set theTitle to title of active tab of window 1 as string
		set theURL to the URL of active tab of window 1 as string
	end tell
	tell application "OmniFocus"
		tell quick entry
			open
			make new inbox task with properties {name:theTitle, note:theURL}
			activate
		end tell
	end tell
end do
