try
	copyURLsToFiles()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try


on copyURLsToFiles()
	tell application "Finder"
		set theSelection to get selection as alias list
		set theURLs to ""
		if theSelection is {} then
			set theURLs to URL of (target of front window as alias)
		else
			repeat with theAlias in theSelection
				set theURL to URL of theAlias
				
				if theURLs as string is equal to "" then
					set theURLs to theURL
				else
					set theURLs to theURLs & "
" & theURL
				end if
			end repeat
		end if
		set the clipboard to theURLs
	end tell
end copyURLsToFiles
