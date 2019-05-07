try
	openSourceInTextMate()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openSourceInTextMate()
	set theCommand to "/usr/local/bin/mate -a"
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theSource to source of document 1
		end tell
	else
		tell application "Safari"
			set theSource to source of document 1
		end tell
	end if
	do shell script "echo " & the quoted form of theSource & " | " & theCommand
end openSourceInTextMate
