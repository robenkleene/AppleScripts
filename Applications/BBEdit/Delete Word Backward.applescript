try
	deletePreviousWord()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on deletePreviousWord()
	tell application "BBEdit"
		tell text of front text window
			-- For `isn't`, with `\w`, `isn` is left, with `\S` the whole word is deleted
			set theFind to find "\\S*[ \\t]*" options {search mode:grep, backwards:true}
			if found of theFind = true then
				delete text of found object of theFind
			end if
		end tell
	end tell
end deletePreviousWord
