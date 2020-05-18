# Defined in - @ line 1
function composer --description 'alias composer=docker run --rm -it -v "$PWD":/app -v /tmp:/tmp -u (id -u):(id -g) composer composer'
	docker run --rm -it \
		--env COMPOSER_HOME \
		--env COMPOSER_CACHE_DIR \
		--volume $COMPOSER_HOME:$COMPOSER_HOME \
		--volume $COMPOSER_CACHE_DIR:$COMPOSER_CACHE_DIR \
		--volume $PWD:/app \
		--user (id -u):(id -g) \
		composer $argv;
end
