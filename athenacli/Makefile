REPO := quay.io/ouzi/athenacli
TAG ?= 0.1.0

ATHENACLI_VERSION ?= 0.1.4

.PHONY: build push

build:
	@docker build \
	--build-arg ATHENACLI_VERSION=$(ATHENACLI_VERSION) \
	-t $(REPO):$(TAG) .
	
	@docker tag $(REPO):$(TAG) $(REPO):latest

push: build
	@docker push $(REPO):$(TAG)
	@docker push $(REPO):latest
