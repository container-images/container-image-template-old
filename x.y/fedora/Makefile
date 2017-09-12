.PHONY: doc build run test

VERSION ?= x.y
IMAGE_NAME = image
OS_HELP_VALUES = ./help/help.values
VERSION_HELP_VALUES = ../help/help.values
HELP_MD = ./help/help.md

doc:
	mkdir -p ./root/
	cp ../../help/help.md ./help/
	test -f ${OS_HELP_VALUES} && source ${OS_HELP_VALUES}; \
	test -f ${VERSION_HELP_VALUES} && source ${VERSION_HELP_VALUES}; \
	cat ${HELP_MD} | envsubst > ${HELP_MD}.new; \
	mv ${HELP_MD}.new ${HELP_MD}
	go-md2man -in=${HELP_MD} -out=./root/help.1

build: doc
	docker build --tag=$(IMAGE_NAME):$(VERSION) .

run: build
	docker run -d $(IMAGE_NAME):$(VERSION)

test: build
	cd ../../tests; VERSION=$(VERSION) DOCKERFILE="../x.y/fedora/Dockerfile" MODULE="docker" URL="docker=$(IMAGE_NAME):$(VERSION)" make all
