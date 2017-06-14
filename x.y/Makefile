PHONY: .run .build .test

run:
	cd fedora && make run $(VERSION)
	cd centos && make run $(VERSION)
	cd rhel && make run $(VERSION)

build:
	cd fedora && make build $(VERSION)
	cd centos && make build $(VERSION)
	cd rhel && make build $(VERSION)

test:
	cd fedora && make test $(VERSION)
	cd centos && make test $(VERSION)
	cd rhel && make test $(VERSION)
