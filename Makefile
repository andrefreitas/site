DOCKER_REPOSITORY=andrefreitas/site

build:
	sass styles.sass:styles.css --style compressed
	docker build -t $(DOCKER_REPOSITORY) .

push:
	docker push $(DOCKER_REPOSITORY)

serve:
	make serve-http watch -j2

serve-http:
	python3 -m http.server

watch:
	sass --watch styles.sass:styles.css --style compressed
