function dark --description 'Switch to dark theme'
	bash -c "~/.config/termite/theme-switcher.sh dark"
	bash -c "~/.config/bat/theme-switcher.sh dark"
	set fish_pager_color_prefix -u white
	set -g theme_color_scheme base16-dark
end

function light --description 'Switch to light theme'
	bash -c "~/.config/termite/theme-switcher.sh light"
	bash -c "~/.config/bat/theme-switcher.sh light"
	set fish_pager_color_prefix -u black
	set -g theme_color_scheme solarized-light
end
