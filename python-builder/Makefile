PYTHON_VERSION ?= 3.8.2

REPO := quay.io/ouzi/python-builder

TAG ?= $(PYTHON_VERSION)

.PHONY: build push

build:
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_PYTHON_VERSION="$(PYTHON_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_PYTHON_VERSION="$(PYTHON_VERSION)"