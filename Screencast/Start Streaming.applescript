if application "Mail" is running then tell application "Mail" to quit
if application "Messages" is running then tell application "Messages" to quit
if application "Slack" is running then tell application "Slack" to quit
if application "Calendar" is running then tell application "Calendar" to quit
if application "OmniFocus" is running then tell application "OmniFocus" to quit
if application "Reminders" is running then tell application "Reminders" to quit

tell application "Safari Technology Preview" to open location "https://www.twitch.tv/popout/robenkleene/chat?popout=popout_chat"
tell application "OBS" to activate
tell application "Music" to activate
