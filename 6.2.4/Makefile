.PHONY: help

.DEFAULT_GOAL := help

TAG ?= 6.2.4
PREFIX ?= stakater
IMAGE ?= elasticsearch

SHELL := /bin/bash

help: # http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: build-image push-image ## build & push docker image

build-image: ## build the docker image
	sh build.sh

push-image: ## push the docker image
	docker push $(PREFIX)/$(IMAGE):$(TAG)