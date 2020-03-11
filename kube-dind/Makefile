DOCKER_VERSION ?= 18.09
HELM_VERSION ?= 3.0.3

REPO := quay.io/ouzi/kube-dind

TAG ?= $(DOCKER_VERSION)

.PHONY: build push

build: 
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_DOCKER_VERSION="$(DOCKER_VERSION)",_HELM_VERSION="$(HELM_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_DOCKER_VERSION="$(DOCKER_VERSION)",_HELM_VERSION="$(HELM_VERSION)"