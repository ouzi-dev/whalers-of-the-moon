REPO := quay.io/ouzi/gcloud-builder
TAG ?= $(GCLOUD_VERSION)

GCLOUD_VERSION ?= 398.0.0

.PHONY: build push

build:
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO)\
,_GCLOUD_VERSION="$(GCLOUD_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO)\
,_GCLOUD_VERSION="$(GCLOUD_VERSION)"