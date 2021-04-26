tell application "System Preferences"
	activate
	set the current pane to pane id "com.apple.preference.sidecar"
	get the name of every anchor of pane id "com.apple.preference.sidecar"
	delay 1
	tell application "System Events"
		set target_button to a reference to (first button whose name is "Disconnect") of (window "Sidecar" of application process "System Preferences")
		if target_button exists then
			click target_button
		else
			click menu button "Select Device" of window "Sidecar" of application process "System Preferences"
			count menu items of menu of menu button "Select Device" of window "Sidecar" of application process "System Preferences"
			select item 1 of menu button "Select Device" of window "Sidecar" of application process "System Preferences"
			key code 125
			key code 76
		end if
	end tell
	quit
end tell
