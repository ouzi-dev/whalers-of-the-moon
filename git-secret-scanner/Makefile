REPO := quay.io/ouzi/git-secret-scanner
TAG ?= 0.0.1

AWS_GIT_SECRETS_VERSION ?= 1.3.0


.PHONY: build push

build:
	@docker build \
	--build-arg AWS_GIT_SECRETS_VERSION=$(AWS_GIT_SECRETS_VERSION) \
	-t $(REPO):$(TAG) .
	
	@docker tag $(REPO):$(TAG) $(REPO):latest

push: build
	@docker push $(REPO):$(TAG)
	@docker push $(REPO):latest
