if application "Mail" is running then tell application "Mail" to quit
if application "Messages" is running then tell application "Messages" to quit
if application "Slack" is running then tell application "Slack" to quit
if application "Calendar" is running then tell application "Calendar" to quit
if application "OmniFocus" is running then tell application "OmniFocus" to quit
if application "Reminders" is running then tell application "Reminders" to quit

set theURL to "https://www.twitch.tv/popout/robenkleene/chat?popout=popout_chat"
tell application "System Events"
	if exists (processes where name is "Safari Technology Preview") then
		tell application "Safari Technology Preview"
			open location theURL
		end tell
	else
		tell application "Safari"
			open location theURL
		end tell
	end if
end tell

tell application "OBS" to activate
tell application "Music"
	set shuffle enabled to true
	play (every track whose genre is "Web")
end tell
