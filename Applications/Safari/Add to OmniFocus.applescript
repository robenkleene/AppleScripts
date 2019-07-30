try
	makeTodos()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on makeTodos()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	else
		tell application "Safari"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	end if
	tell application "OmniFocus"
		tell quick entry
			open
			make new inbox task with properties {name:theTitle, note:theURL}
			activate
		end tell
	end tell
end makeTodos
