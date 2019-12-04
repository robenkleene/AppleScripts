-- This will fail if the document is edited, because in that case Xcode appends "Edited" to the window name

try
	copyDocumentNameToClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyDocumentNameToClipboard()
	tell application "Xcode"
		set theFileName to name of document 1 whose name ends with (word -1 of (get name of window 1))
		set the clipboard to theFileName
	end tell
end copyDocumentNameToClipboard
