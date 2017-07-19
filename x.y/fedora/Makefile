.PHONY: doc doc-patch build run test

TOPLEVEL_HELP = ../../root/help.md
LOCAL_HELP = ./root/help.md
LOCAL_HELP_PATCH = $(LOCAL_HELP).patch
VERSION ?= x.y
IMAGE_NAME = image

doc:
# If help.md already exists in ./root/, we must check whether it's been changed:
#   1) if a patch exists, we check it against the main help.md file with patch applied
#   2) if a patch doesn't exist, we check it against the main help.md file
#   If we find some differences, we fail, since user did some modifications
#   and forgot to run `make doc-patch`.
	mkdir -p ./root/
	if [ -a $(LOCAL_HELP) ]; then \
		CHANGES_MADE=0; \
		if  [ -a $(LOCAL_HELP_PATCH) ]; then \
			TEMPFILE=`mktemp`; \
			patch `realpath $(TOPLEVEL_HELP)` `realpath $(LOCAL_HELP_PATCH)` -o - > $${TEMPFILE} 2> /dev/null; \
			diff -u $${TEMPFILE} $(LOCAL_HELP) || CHANGES_MADE=1; \
			rm $${TEMPFILE} ;\
		else \
			diff -u $(TOPLEVEL_HELP) $(LOCAL_HELP) || CHANGES_MADE=1; \
		fi; \
		if [ "$${CHANGES_MADE}" -eq "1" ]; then \
			echo -e "\nERROR: $(LOCAL_HELP) has been changed (see above)"; \
	                echo "Run 'make doc-patch' or remove the changes."; \
			exit 1; \
		fi; \
	fi;
	cp $(TOPLEVEL_HELP) ./root/
	if [ -a $(LOCAL_HELP_PATCH) ]; then \
		patch -p1 <$(LOCAL_HELP_PATCH); \
	fi;
	go-md2man -in=./root/help.md -out=./root/help.1

doc-patch:
	diff -u $(TOPLEVEL_HELP) $(LOCAL_HELP) > $(LOCAL_HELP_PATCH) || :

build: doc
	docker build --tag=$(IMAGE_NAME):$(VERSION) .

run: build
	docker run -d $(IMAGE_NAME):$(VERSION)

test: build
	cd ../tests; DOCKERFILE="../fedora/Dockerfile" MODULE=docker URL="docker=$(IMAGE_NAME):$(VERSION)" make all
	cd ../behave-tests; MODULE=docker URL="docker=$(IMAGE_NAME):$(VERSION)" make all
