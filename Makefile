DOCKER_REPOSITORY=docker.andrefreitas.pt/site

build-css:
	sass styles.sass:styles.css --style compressed

docker-build: build-css
	docker build -t $(DOCKER_REPOSITORY) .

docker-push:
	docker push $(DOCKER_REPOSITORY)

serve:
	make serve-http watch -j2

serve-http:
	python3 -m http.server 4001

watch:
	sass --watch styles.sass:styles.css --style compressed
