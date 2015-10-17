watch:
	sass --watch styles.sass:styles.css --style compressed

build:
	docker build -t andrefreitas.pt/site .

push:
	docker push andrefreitas.pt/site

serve:
	python3 -m http.server 8001
