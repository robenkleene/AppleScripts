try
	openTMUXTerminal()
on error errMsg number errNum
	if errNum is not equal to -128 then
		activate -- This prevents a beep when scripts are run from LaunchBar but it also makes the script run slower from the Script Menu
		display dialog "AppleScript encountered an error." & ¬
			" Error Message: " & errMsg & " Number " & errNum
	end if
end try

on openTMUXTerminal()
	tell application "iTerm"
		set theWindow to (create window with default profile)
		tell theWindow
			delay 0.5 -- Delay because of a bug, try removing later
			tell current session of theWindow
				write text "tmux_shell_new"
				activate
			end tell
		end tell
	end tell
end openTMUXTerminal
