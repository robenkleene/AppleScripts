try
	copyDocumentPathToClipboard()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyDocumentPathToClipboard()
	tell application "Xcode"
		set theDocument to document 1 whose name ends with (word -1 of (get name of window 1))
		(* set theDocument to front text document *)
		set thePath to the path of theDocument
		set the clipboard to thePath
	end tell
end copyDocumentPathToClipboard
