try
	dimissAllNotifications()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on dimissAllNotifications()
	tell application "System Events"
		tell process "Notification Center"
			set theWindows to every window
			repeat with theWindow in theWindows
				click theWindow
			end repeat
		end tell
	end tell
end dimissAllNotifications
