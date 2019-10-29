REPO := quay.io/ouzi/toolbox
TAG ?= 0.1.2

GO_BUILDER_TAG ?= 1.13.1
HELM_VERSION ?= v3.0.0-beta.5

.PHONY: build push

build:
	@docker build \
	--build-arg HELM_VERSION=$(HELM_VERSION) \
	--build-arg GO_BUILDER_TAG=$(GO_BUILDER_TAG) \
	-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)