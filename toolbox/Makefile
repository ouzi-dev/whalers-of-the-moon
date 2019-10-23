REPO := quay.io/ouzi/toolbox
TAG ?= 0.1
HELM_VERSION ?= v3.0.0-beta.4

.PHONY: build push

build: 
	@docker build \
	--build-arg HELM_VERSION=$(HELM_VERSION) \
	-t $(REPO):$(TAG) .

push: 
	@docker push $(REPO):$(TAG)