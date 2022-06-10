tell application "Adobe Photoshop 2022"
	set theFilePath to ((path to home folder) as string) & "Developer:Projects:Environment:app-scripts:photoshop:set-markup-font.js"
	do javascript (file theFilePath)
end tell
