# Defined in - @ line 1
function ls --description 'alias ls=exa'
	exa  $argv;
end

function tree --description 'alias tree=exa --tree'
	exa --tree $argv;
end