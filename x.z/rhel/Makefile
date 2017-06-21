.PHONY: doc build run test

VERSION ?= x.z
IMAGE_NAME = image

doc:
	go-md2man -in=./root/help.md -out=./root/help.1

build: doc
	docker build --tag=$(IMAGE_NAME):$(VERSION) .

run: build
	docker run -d $(IMAGE_NAME):$(VERSION)

test: build
	cd ../tests; DOCKERFILE="../fedora/Dockerfile" MODULE=docker URL="docker=$(IMAGE_NAME):$(VERSION)" make all
	cd ../behave-tests; MODULEMDURL=$(MODULEMDURL) MODULE=docker URL="docker=$(IMAGE_NAME)" make all
