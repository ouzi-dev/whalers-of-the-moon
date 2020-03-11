DOCKER_VERSION ?= stable

REPO := quay.io/ouzi/dind

TAG ?= $(DOCKER_VERSION)

.PHONY: build push

build: 
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_DOCKER_VERSION="$(DOCKER_VERSION)"

push: build
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_DOCKER_VERSION="$(DOCKER_VERSION)"