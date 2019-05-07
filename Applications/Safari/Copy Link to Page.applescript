if application "Safari Technology Preview" is frontmost then
	tell application "Safari Technology Preview"
		set the clipboard to the URL of front document as string
	end tell
else
	tell application "Safari"
		set the clipboard to the URL of front document as string
	end tell
end if

