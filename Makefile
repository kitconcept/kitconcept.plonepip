# convenience makefile to boostrap & run buildout
version = 2.7
PLONE_RESTAPI_VERSION = $(shell grep plone.restapi requirements/requirements-addons.txt | cut -d "=" -f3)

all: build

build:
	docker build . -t kitconcept/plone.restapi:${PLONE_RESTAPI_VERSION}

push:
	docker push kitconcept/plone.restapi:${PLONE_RESTAPI_VERSION}
	docker tag kitconcept/plone.restapi:${PLONE_RESTAPI_VERSION} kitconcept/plone.restapi:latest
	docker push kitconcept/plone.restapi:latest

.PHONY: all clean
