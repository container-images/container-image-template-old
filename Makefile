.PHONY: build run default test

IMAGE_NAME = image


default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	docker run -d $(IMAGE_NAME)

test:
	run_test.sh
