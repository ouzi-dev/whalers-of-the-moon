GOLANG_VERSION ?= 1.13.0

GOLANGCI_LINT_VERSION ?= 1.18.0

REPO := quay.io/ouzi/go-builder

TAG ?= $(GOLANG_VERSION)

.PHONY: build push

build: 
	@docker build -t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)