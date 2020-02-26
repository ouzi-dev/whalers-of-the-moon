HELM2_VERSION ?= v2.16.3
HELM3_VERSION ?= v3.1.1

REPO := quay.io/ouzi/helm

.PHONY: build push build-helm2 build-helm3 push-helm2 push-helm3

build: build-helm2 build-helm3

push: push-helm2 push-helm3

build-helm2: 
	@docker build --build-arg HELM_VERSION=$(HELM2_VERSION) \
		-t $(REPO):$(HELM2_VERSION) .

build-helm3: 
	@docker build --build-arg HELM_VERSION=$(HELM3_VERSION) \
		-t $(REPO):$(HELM3_VERSION) .

push-helm2: build-helm2
	@docker push $(REPO):$(HELM2_VERSION)

push-helm3: build-helm3
	@docker push $(REPO):$(HELM3_VERSION)	