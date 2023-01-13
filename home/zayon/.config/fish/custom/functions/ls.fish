# Defined in - @ line 1
function ls --description 'alias ls=exa'
	exa  $argv;
end

function tree --description 'alias tree=exa --tree'
	exa --tree $argv;
end

function la --description 'alias la=exa -a'
	exa -la $argv;
end