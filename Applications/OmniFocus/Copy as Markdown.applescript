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
				set theNote to note of theTree
				set theURL to ""
				if theNote starts with "http" then
					set theURL to the first paragraph of theNote
					set theNote to rest of the theNote's paragraphs
				end if
				if (count of theURL) is greater than 0 then
					set the clipboard to (the clipboard) & "- [" & theTitle & "](" & theURL & ")"
				else
					set the clipboard to (the clipboard) & "- " & theTitle
				end if
				if (count of theNote) is greater than 0 then
					set the clipboard to (the clipboard) & "

	" & theNote & "
	
"
				else
					set the clipboard to (the clipboard) & "
"
				end if
			end repeat
		end tell
	end tell
end copyAsMarkdown
