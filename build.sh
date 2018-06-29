#!/bin/bash
docker build . -t kitconcept/plone.restapi:3.2.1
docker push kitconcept/plone.restapi:3.2.1
