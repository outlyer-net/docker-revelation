#!/usr/bin/make -f

TAG=latest
IMAGE_NAME=outlyernet/revelation

# Variables for installation
DESTDIR:=
prefix:=/usr/local
bindir:=$(prefix)/bin

# Command-line parameters
FILE:=

launch:
	@# Possibly useful additional arguments
	@#	--user $(shell id -u):$(shell id -g) \ 
	@#	-v /etc/passwd:/etc/passwd:ro \ 
	exec docker run --rm -it \
	    -v /tmp/.X11-unix/:/tmp/.X11-unix/:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-v $(HOME):$(HOME):rw \
		--workdir $(HOME) \
		--user $(shell id -u):$(shell id -g) \
		-e DISPLAY \
		$(IMAGE_NAME):$(TAG) \
		$(FILE)

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

# Helper rule to build older versions without overwriting :latest
build-tag-%:
	docker build -t $(IMAGE_NAME):$* .

# Launch a shell within a container, helpful for testing changes
shell:
	exec docker run --rm -it \
	    -v /tmp/.X11-unix/:/tmp/.X11-unix/:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v $(HOME):$(HOME):rw \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		--workdir $(HOME) \
		-e DISPLAY \
		--entrypoint /bin/bash \
		--user $(shell id -u):$(shell id -g) \
		$(IMAGE_NAME):$(TAG)

install:
	install -m755 $(MAKEFILE_LIST) $(DESTDIR)$(bindir)/revelation-docker

uninstall:
	$(RM) $(DESTDIR)$(bindir)/revelation-docker
