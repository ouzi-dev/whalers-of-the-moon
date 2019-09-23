DOCKER_VERSION ?= 18.09

REPO := quay.io/ouzi/kube-dind

TAG ?= $(DOCKER_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg DOCKER_VERSION=$(DOCKER_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)