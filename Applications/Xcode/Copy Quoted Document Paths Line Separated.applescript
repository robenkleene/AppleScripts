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
		set thePaths to ""
		set theDocuments to source documents
		repeat with theDocument in rest of theDocuments
			set thePath to the path of theDocument
			set thePaths to thePaths & the quoted form of thePath & "
"
		end repeat
		set the clipboard to thePaths
	end tell
end copyDocumentPathToClipboard
