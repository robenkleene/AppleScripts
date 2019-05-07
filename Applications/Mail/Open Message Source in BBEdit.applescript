try
	getMessageSource()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on getMessageSource()
	tell application "Mail"
		set selectedMessages to selection
		if (count of selectedMessages) is greater than 1 then
			display dialog "Please select just one message."
			return
		else
			set theMessage to item 1 of selectedMessages
			set theContent to theMessage's source
		end if
	end tell
	set theResult to do shell script "echo " & the quoted form of theContent & "| sed -n -e '/^\\s*$/,$p'"
	tell application "BBEdit"
		activate
		make new text document with properties {contents:theResult}
	end tell
end getMessageSource
