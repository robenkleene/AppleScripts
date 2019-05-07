try
	swapSearchEngines()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on swapSearchEngines()
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set theURL to URL of current tab of window 1
		end tell
	else
		tell application "Safari"
			set theURL to URL of current tab of window 1
		end tell
	end if
	set theDuckDuckGoPrefix to "https://duckduckgo.com/?q="
	set theGooglePrefix to "https://www.google.com/search?client=safari&rls=en&q="
	if theDuckDuckGoPrefix is in theURL then
		set theDestination to theGooglePrefix
		set theOriginal to theDuckDuckGoPrefix
	else
		set theDestination to theDuckDuckGoPrefix
		set theOriginal to theGooglePrefix
	end if
	set theNewURL to replaceText(theOriginal, theDestination, theURL)
	if application "Safari Technology Preview" is frontmost then
		tell application "Safari Technology Preview"
			set URL of current tab of window 1 to theNewURL
		end tell
	else
		tell application "Safari"
			set URL of current tab of window 1 to theNewURL
		end tell
	end if
end swapSearchEngines

on replaceText(find, replace, subject)
	set prevTIDs to text item delimiters of AppleScript
	set text item delimiters of AppleScript to find
	set subject to text items of subject
	set text item delimiters of AppleScript to replace
	set subject to subject as text
	set text item delimiters of AppleScript to prevTIDs
	return subject
end replaceText
