PYTHON_VERSION ?= 3.8.1

REPO := quay.io/ouzi/python-builder

TAG ?= $(PYTHON_VERSION)

.PHONY: build push

build: 
	@docker build --build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		-t $(REPO):$(TAG) .

push: build
	@docker push $(REPO):$(TAG)
