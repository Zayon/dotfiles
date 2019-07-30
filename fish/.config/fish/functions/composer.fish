# Defined in - @ line 1
function composer --description 'alias composer=docker run -it --rm -u (id -u):(id -g) -v (echo "$PWD"):/app -v /tmp:/tmp composer composer'
	docker run -it --rm -u (id -u):(id -g) -v (echo "$PWD"):/app -v /tmp:/tmp composer composer $argv;
end
