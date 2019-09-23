DOCKER_VERSION ?= stable

REPO := quay.io/ouzi/dind

TAG ?= $(DOCKER_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg DOCKER_VERSION=$(DOCKER_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)