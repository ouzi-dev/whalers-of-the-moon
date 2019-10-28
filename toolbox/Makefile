REPO := quay.io/ouzi/toolbox
TAG ?= 0.1.1

GO_BUILDER_TAG ?= 1.13.1
HELM_VERSION ?= v2.15.1

.PHONY: build push

build:
	@docker build \
	--build-arg HELM_VERSION=$(HELM_VERSION) \
	--build-arg GO_BUILDER_TAG=$(GO_BUILDER_TAG) \
	-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)