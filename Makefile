.PHONY: doc build run default test

VERSION ?= x.y

default: run

doc:
	cd $(VERSION)/$(TARGET) && make doc VERSION=$(VERSION)

build:
	cd $(VERSION)/$(TARGET) && make build VERSION=$(VERSION)

run:
	cd $(VERSION)/$(TARGET) && make run VERSION=$(VERSION)

test:
	cd $(VERSION)/$(TARGET) && make test VERSION=$(VERSION)

all:
	cd x.y && make build VERSION=x.y
	cd x.z && make build VERSION=x.z	
