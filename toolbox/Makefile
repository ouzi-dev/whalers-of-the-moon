REPO := quay.io/ouzi/toolbox
TAG ?= 0.1.3

GO_BUILDER_TAG ?= 1.13.1
HELM_VERSION ?= 3.0.0-rc.2
KUBECTL_VERSION ?= v1.16.2
AWS_CLI_VERSION ?= 1.16.274
TF_VERSION ?= 0.12.13
GOTPL_VERSION ?= v0.7
.PHONY: build push

build:
	@docker build \
	--build-arg HELM_VERSION=$(HELM_VERSION) \
	--build-arg GO_BUILDER_TAG=$(GO_BUILDER_TAG) \
	--build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) \
	--build-arg AWS_CLI_VERSION=$(AWS_CLI_VERSION) \
	--build-arg TF_VERSION=$(TF_VERSION) \
	--build-arg GOTPL_VERSION=$(GOTPL_VERSION) \
	-t $(REPO):$(TAG) .
	
	@docker tag $(REPO):$(TAG) $(REPO):latest

push: build
	@docker push $(REPO):$(TAG)
	@docker push $(REPO):latest