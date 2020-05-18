# https://github.com/ekalinin/github-markdown-toc
function gh-md-toc --description 'Runs github-markdown-toc'
	docker run --rm -it \
		--volume $PWD:/data \
		markdown-toc-generator $argv
end
