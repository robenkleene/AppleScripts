tell application "Adobe Photoshop 2022"
	set foreground color to {class:RGB color, red:72, green:255, blue:255}
	set theFilePath to ((path to home folder) as string) & "Developer:Projects:Environment:app-scripts:photoshop:setup-markup.js"
	do javascript (file theFilePath)
end tell
