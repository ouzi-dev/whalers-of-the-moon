REPO := quay.io/ouzi/toolbox
TAG ?= 0.1.12

GO_BUILDER_TAG ?= 1.13.8
HELM_VERSION ?= 3.1.1
KUBECTL_VERSION ?= v1.17.2
AWS_CLI_VERSION ?= 1.17.9
TF_VERSION ?= 0.12.20
GOTPL_VERSION ?= v0.7
CREDSTASH_VERSION ?= 1.16.1
GCLOUD_VERSION ?= 278.0.0

.PHONY: build push

build:
	@docker build \
	--build-arg HELM_VERSION=$(HELM_VERSION) \
	--build-arg GO_BUILDER_TAG=$(GO_BUILDER_TAG) \
	--build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) \
	--build-arg AWS_CLI_VERSION=$(AWS_CLI_VERSION) \
	--build-arg TF_VERSION=$(TF_VERSION) \
	--build-arg GOTPL_VERSION=$(GOTPL_VERSION) \
	--build-arg CREDSTASH_VERSION=$(CREDSTASH_VERSION) \
	--build-arg GCLOUD_VERSION=$(GCLOUD_VERSION) \
	-t $(REPO):$(TAG) .
	
	@docker tag $(REPO):$(TAG) $(REPO):latest

push: build
	@docker push $(REPO):$(TAG)
	@docker push $(REPO):latest
