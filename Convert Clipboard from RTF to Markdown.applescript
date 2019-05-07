try
	convertToMarkdown()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on convertToMarkdown()
	-- set theClipboard to the clipboard as «class RTF »
	set theHTML to do shell script "osascript -e 'the clipboard as «class RTF »' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | textutil -stdin -stdout -convert html -format rtf"
	set theMarkdown to do shell script "echo " & the quoted form of theHTML & "| /usr/local/bin/pandoc -f html-native_divs-native_spans -t markdown --wrap=none"
	set the clipboard to theMarkdown
end convertToMarkdown
