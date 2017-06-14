.PHONY: build run default test

VERSION ?= x.y

default: run

build:
	cd $(VERSION)/$(TARGET) && make build VERSION=$(VERSION)

run:
	cd $(VERSION)/$(TARGET) && make run VERSION=$(VERSION)

test:
	cd $(VERSION)/$(TARGET) && make test VERSION=$(VERSION)
