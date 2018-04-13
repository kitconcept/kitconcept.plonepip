#!/bin/bash
docker build . -t kitconcept/plone.restapi:latest
docker push kitconcept/plone.restapi:latest
