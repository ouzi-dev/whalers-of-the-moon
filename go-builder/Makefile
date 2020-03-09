GOLANG_VERSION ?= 1.14.0

GOLANGCI_LINT_VERSION ?= 1.23.6

REPO := quay.io/ouzi/go-builder

TAG ?= $(GOLANG_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		--build-arg GOLANGCI_LINT_VERSION=$(GOLANGCI_LINT_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)