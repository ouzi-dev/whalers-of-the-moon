GOLANG_VERSION ?= 1.13.5

GOLANGCI_LINT_VERSION ?= 1.21.0

REPO := quay.io/ouzi/go-builder

TAG ?= $(GOLANG_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		--build-arg GOLANGCI_LINT_VERSION=$(GOLANGCI_LINT_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)