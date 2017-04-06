.PHONY: build build-x.y build-x.z run defult

IMAGE_NAME = image
MODULEMDURL=file://your_module_name.yaml

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
	cd tests; MODULEMDURL=$(MODULEMDURL) MODULE=docker URL="docker=$(IMAGE_NAME)" make all
	cd behave-tests; MODULEMDURL=$(MODULEMDURL) MODULE=docker URL="docker=$(IMAGE_NAME)" make all
