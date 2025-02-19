-- Toggle Other Display Accessibility those are good for eink

tell application "System Preferences"
	launch
	reveal anchor "Seeing_Display" of pane "Accessibility"
end tell
tell application "System Events"
	tell application process "System Preferences"
		set frontmost to true
		delay 1
		tell window "Accessibility"
			repeat until exists checkbox "Invert colors" of tab group 1 of group 1
				delay 0.01
			end repeat
			click second checkbox of tab group 1 of group 1 -- Reduce motion
			click fifth checkbox of tab group 1 of group 1 -- Show toolbar btn shape
			
			set IncreaseContrast to third checkbox of tab group 1 of group 1
			click IncreaseContrast
			-- Click ReduceTrans when IncreaseContrast is not checked
			set ReduceTrans to fourth checkbox of tab group 1 of group 1
			tell IncreaseContrast
				if not (its value as boolean) then click ReduceTrans
			end tell
		end tell
	end tell
end tell
tell application "System Preferences" to if it is running then quit

-- Toggle Light Theme  

tell application "System Events"
	tell appearance preferences
		set dark mode to not dark mode
	end tell
end tell