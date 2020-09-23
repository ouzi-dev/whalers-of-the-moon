HELM2_VERSION ?= v2.16.12
HELM3_VERSION ?= v3.3.4

REPO := quay.io/ouzi/helm

.PHONY: build push

build: 
	@gcloud builds submit --config cloudbuild-build.yaml --substitutions=_QUAY_REPO=$(REPO),_HELM2_VERSION="$(HELM2_VERSION)",_HELM3_VERSION="$(HELM3_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml --substitutions=_QUAY_REPO=$(REPO),_HELM2_VERSION="$(HELM2_VERSION)",_HELM3_VERSION="$(HELM3_VERSION)"
