REPO := quay.io/ouzi/athenacli
TAG ?= 0.1.0

ATHENACLI_VERSION ?= 0.1.4

.PHONY: build push

build:
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_ATHENACLI_VERSION="$(ATHENACLI_VERSION)"

push: 
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_ATHENACLI_VERSION="$(ATHENACLI_VERSION)"
