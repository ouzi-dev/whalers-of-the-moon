DOCKER_VERSION ?= 18.09
HELM_VERSION ?= 3.0.3

REPO := quay.io/ouzi/kube-dind

TAG ?= $(DOCKER_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg DOCKER_VERSION=$(DOCKER_VERSION) \
		--build-arg HELM_VERSION=$(HELM_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)