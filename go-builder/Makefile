GOLANG_VERSION ?= 1.14.2

GOLANGCI_LINT_VERSION ?= 1.24.0

REPO := quay.io/ouzi/go-builder

TAG ?= $(GOLANG_VERSION)

.PHONY: build push

build: 
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_GOLANG_VERSION="$(GOLANG_VERSION)",_GOLANGCI_LINT_VERSION="$(GOLANGCI_LINT_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_GOLANG_VERSION="$(GOLANG_VERSION)",_GOLANGCI_LINT_VERSION="$(GOLANGCI_LINT_VERSION)"