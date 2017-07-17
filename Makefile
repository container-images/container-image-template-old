.PHONY: build run default test

IMAGE_NAME = image


default: run

doc:
	go-md2man -in=./root/help.md -out=./root/help.1

build: doc
	docker build --tag=$(IMAGE_NAME) .

run: build
	docker run -d $(IMAGE_NAME)

test:
	run_test.sh
