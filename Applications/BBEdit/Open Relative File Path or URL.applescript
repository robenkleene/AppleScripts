try
	openRelativeFilePath()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openRelativeFilePath()
	tell application "BBEdit"
		set theURL to missing value
		set theRange to missing value
		tell text of front text document
			set backwardFind to find "\\s|\\(" selecting match false ¬
				options {backwards:true, extend selection:false, returning results:false, search mode:grep, starting at top:false, wrap around:false}
			if backwardFind's found is true then
				set forwardFind to find "$|\\s|\\)" selecting match false ¬
					options {backwards:false, extend selection:false, returning results:false, search mode:grep, starting at top:false, wrap around:false}
				if backwardFind's found is true then
					set theEnd to (forwardFind's found object's characterOffset) - 1
					set theStart to (backwardFind's found object's characterOffset) + 1
					set theRange to (characters theStart thru (theEnd))
				end if
			end if
		end tell
	end tell
	if theRange is not missing value then
		if ((theRange as string) starts with "http://") or ((theRange as string) starts with "https://") then
			set theURL to theRange as string
			open location theURL
		else
			tell application "BBEdit"
				set theFile to file of document 1
				tell application "Finder"
					set theContainer to container of (theFile as alias) as string
				end tell
			end tell
			set theDirectoryPath to POSIX path of (theContainer as string)
			set theFilePath to theDirectoryPath & theRange
			tell application "BBEdit"
				open theFilePath
			end tell
		end if
	end if
end openRelativeFilePath
