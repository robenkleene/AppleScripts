try
	openInTerminal()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openInTerminal()
	set thePath to my getThePath()
	tell application "Terminal"
		set theWindow to do script ""
		do script "cd " & quoted form of thePath in theWindow
		activate
	end tell
end openInTerminal

on getThePath()
	tell application "OmniOutliner"
		
		set theDocument to document 1
	end tell
	set theFile to theDocument's file
	set thePath to quoted form of theFile's POSIX path
	set theDirectoryPath to do shell script "dirname " & thePath
end getThePath
