try
	tell application "Finder"
		set the clipboard to target of front window as alias as text
	end tell
on error
	set the clipboard to (path to desktop) as text
end try

