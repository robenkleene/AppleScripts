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
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theURL to URL of current tab of window 1
		end tell
	else
		tell application "Safari"
			set theURL to URL of current tab of window 1
		end tell
	end if
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			tell window 1 to make new tab with properties {URL:theURL}
		end tell
	else
		tell application "Safari"
			tell window 1 to make new tab with properties {URL:theURL}
		end tell
	end if
end switchToNewTab
