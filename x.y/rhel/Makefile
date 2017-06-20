.PHONY: build run test

VERSION ?= x.y
IMAGE_NAME = image

build:
	docker build --tag=$(IMAGE_NAME):$(VERSION) .

run: build
	docker run -d $(IMAGE_NAME):$(VERSION)

test: build
	cd ../tests; DOCKERFILE="../rhel/Dockerfile" MODULE=docker URL="docker=$(IMAGE_NAME):$(VERSION)" make all
	cd ../behave-tests; MODULE=docker URL="docker=$(IMAGE_NAME)" make all
