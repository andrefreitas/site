IMAGE=tutum.co/andrefreitas/site
VERSION=latest

linux:
	GOOS=linux GOARCH=amd64 go build server.go

build: linux
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

dev: linux
	docker-compose up dev

deploy: build push

watch:
	sass --watch src/styles.sass:src/styles.css --style compressed
