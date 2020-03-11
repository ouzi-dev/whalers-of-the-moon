REPO := quay.io/ouzi/git-secret-scanner
TAG ?= 0.0.3

AWS_GIT_SECRETS_VERSION ?= 1.3.0


.PHONY: build push

build:
	@gcloud builds submit --config cloudbuild-build.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_AWS_GIT_SECRETS_VERSION="$(AWS_GIT_SECRETS_VERSION)"

push:
	@gcloud builds submit --config cloudbuild-push.yaml \
				--substitutions=_TAG_VERSION=$(TAG),_QUAY_REPO=$(REPO),_AWS_GIT_SECRETS_VERSION="$(AWS_GIT_SECRETS_VERSION)"
