try
	runIt()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on runIt()
	set theDate to do shell script "date +%F"
	tell application "Finder"
		set theSelection to get selection
		repeat with theFile in theSelection
			set the name of theFile to theDate & " " & the name of theFile as text
		end repeat
	end tell
end runIt
