# Defined in - @ line 1
function php --description 'alias php=docker run --rm -it -v "$PWD":/app -w /app -u (id -u):(id -g) php:cli php'
	docker run --rm -it -v "$PWD":/app -w /app -u (id -u):(id -g) php:cli php $argv;
end
