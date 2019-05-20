try
	processMarkdownLinks()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on processMarkdownLinks()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	else
		tell application "Safari"
			set theTitle to name of front document as string
			set theURL to URL of front document as string
		end tell
	end if
	set theLink to "- [" & theTitle & "]" & "(" & theURL & ")"
	set theEncodedURL to encodeText(theLink, true, false)
	open location "bear://x-callback-url/add-text?title=Scratch&text=" & theEncodedURL
end processMarkdownLinks

on encodeText(theText, encodeCommonSpecialCharacters, encodeExtendedSpecialCharacters)
	set theStandardCharacters to "abcdefghijklmnopqrstuvwxyz0123456789"
	set theCommonSpecialCharacterList to "$+!'/?;&@=#%><{}\"~`^\\|*"
	set theExtendedSpecialCharacterList to ".-_:"
	set theAcceptableCharacters to theStandardCharacters
	if encodeCommonSpecialCharacters is false then set theAcceptableCharacters to theAcceptableCharacters & theCommonSpecialCharacterList
	if encodeExtendedSpecialCharacters is false then set theAcceptableCharacters to theAcceptableCharacters & theExtendedSpecialCharacterList
	set theEncodedText to ""
	repeat with theCurrentCharacter in theText
		if theCurrentCharacter is in theAcceptableCharacters then
			set theEncodedText to (theEncodedText & theCurrentCharacter)
		else
			set theEncodedText to (theEncodedText & encodeCharacter(theCurrentCharacter)) as string
		end if
	end repeat
	return theEncodedText
end encodeText

on encodeCharacter(theCharacter)
	set theASCIINumber to (the ASCII number theCharacter)
	set theHexList to {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
	set theFirstItem to item ((theASCIINumber div 16) + 1) of theHexList
	set theSecondItem to item ((theASCIINumber mod 16) + 1) of theHexList
	return ("%" & theFirstItem & theSecondItem) as string
end encodeCharacter
