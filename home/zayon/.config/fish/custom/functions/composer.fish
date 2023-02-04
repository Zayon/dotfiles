# Defined in - @ line 1
function composer
	docker run --rm -it \
		--env COMPOSER_HOME=/tmp/composer-home \
		--env COMPOSER_CACHE_DIR=/tmp/composer-cache \
		--volume $COMPOSER_HOME:/tmp/composer-home \
		--volume $COMPOSER_CACHE_DIR:/tmp/composer-cache \
		--volume $PWD:/app \
		--user (id -u):(id -g) \
		composer $argv;
end
