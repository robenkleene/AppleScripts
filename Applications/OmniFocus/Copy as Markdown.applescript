try
	copyAsMarkdown()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyAsMarkdown()
	tell application "OmniFocus"
		tell the front document
			tell content of document window 1
				set theSelectedTrees to value of every selected tree
			end tell
			set the clipboard to ""
			repeat with theTree in theSelectedTrees
				set theTitle to name of theTree
				set the clipboard to (the clipboard) & "# " & theTitle
				set theNote to note of theTree
				if (count of theNote) is greater than 0 then
					set the clipboard to (the clipboard) & "

" & theNote
				end if
				set the clipboard to (the clipboard) & "

"
			end repeat
		end tell
	end tell
end copyAsMarkdown

