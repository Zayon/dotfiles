function dark --description 'Switch to dark theme'
	bash -c "~/.config/termite/theme-switcher.sh dark"
	bash -c "~/.config/bat/theme-switcher.sh dark"
end

function light --description 'Switch to light theme'
	bash -c "~/.config/termite/theme-switcher.sh light"
	bash -c "~/.config/bat/theme-switcher.sh light"
end
