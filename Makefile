.PHONY: build build-x.y build-x.z run defult

IMAGE_NAME = image


defult: run

build: build-x.y build-x.z

build-x.y:
	docker build --tag=$(IMAGE_NAME):x.y x.y/

build-x.z:
	docker build --tag=$(IMAGE_NAME):x.z x.z/

run: build
	docker run -d $(IMAGE_NAME):x.y
	docker run -d $(IMAGE_NAME):x.z

test:
	run_test.sh
