tell application "OmniFocus"
	tell default document
		make new document window with properties {perspective name:"Inbox"}
		activate
	end tell
end tell
