try
	copyMarkdownLinksToFiles()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on copyMarkdownLinksToFiles()
	tell application "Finder"
		set theSelection to get selection as alias list
		set theLinks to ""
		if theSelection is {} then
			set theAlias to target of front window as alias
			set theURL to URL of theAlias
			set theName to name of theAlias
			set theLinks to "[" & theName & "]" & "(" & theURL & ")"
		else
			repeat with theAlias in theSelection
				set theURL to URL of theAlias
				set theName to name of theAlias
				set theLink to "[" & theName & "]" & "(" & theURL & ")"
				
				if theLinks as string is equal to "" then
					set theLinks to theLink
				else
					set theLinks to theLinks & "
" & theLink
				end if
			end repeat
		end if
		
		set the clipboard to theLinks
	end tell
end copyMarkdownLinksToFiles
