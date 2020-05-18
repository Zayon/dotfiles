function config --description 'dotfile git proxy command'
	/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end