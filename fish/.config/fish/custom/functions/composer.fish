# Defined in - @ line 1
function composer --description 'alias composer=docker run --rm -it -v "$PWD":/app -v /tmp:/tmp -u (id -u):(id -g) composer composer'
	docker run --rm -it -v "$PWD":/app -v /tmp:/tmp -u (id -u):(id -g) composer composer $argv;
end
