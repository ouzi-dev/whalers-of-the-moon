GOLANG_VERSION ?= 1.18.5

GOLANGCI_LINT_VERSION ?= 1.39.0

REPO := quay.io/ouzi/go-builder

TAG ?= $(GOLANG_VERSION)

.PHONY: build push

build-local:
	docker build \
		--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		--build-arg GOLANGCI_LINT_VERSION=$(GOLANGCI_LINT_VERSION) \
		-t $(REPO):$(TAG) .

build: 
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_GOLANG_VERSION="$(GOLANG_VERSION)",_GOLANGCI_LINT_VERSION="$(GOLANGCI_LINT_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_GOLANG_VERSION="$(GOLANG_VERSION)",_GOLANGCI_LINT_VERSION="$(GOLANGCI_LINT_VERSION)"