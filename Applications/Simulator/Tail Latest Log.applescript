try
	tailLatestLog()
on error errMsg number errNum
	if errNum is not equal to -128 then
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on tailLatestLog()
	set theLogPath to do shell script "find $HOME/Library/Logs/CoreSimulator -print0 | xargs -0 -n 100 stat -f\"%m %Sm %N\" | sort -nr | awk '{$1=\"\";print}' | head -1 | perl -pe 's/.*?\\//\\//'"
	tell application "Terminal"
		do script "tail -f " & the quoted form of theLogPath
	end tell
end tailLatestLog
