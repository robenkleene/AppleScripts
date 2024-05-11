try
	switchToNewTab()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on switchToNewTab()
	tell application "Safari"
		set theURL to URL of current tab of window 1
		tell window 1 to make new tab with properties {URL:theURL}
	end tell
end switchToNewTab
