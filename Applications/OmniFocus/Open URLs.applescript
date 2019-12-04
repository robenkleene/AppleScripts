try
	openURLs()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openURLs()
	tell application "OmniFocus"
		tell the front document
			tell content of document window 1
				set theSelectedTrees to value of every selected tree
			end tell
			set theText to ""
			repeat with theTree in theSelectedTrees
				set theTitle to name of theTree
				set theText to theText & theTitle
				set theNote to note of theTree
				if (count of theNote) is greater than 0 then
					set theText to theText & "

" & theNote
				end if
				set theText to (theText) & "

"
				
			end repeat
			do shell script "echo " & the quoted form of theText & " | ~/.bin/urls_open"
		end tell
	end tell
end openURLs
