
GCLOUD_KEY_FILE := /etc/google-service-account/service-account.json

.PHONY: go-builder-push
go-builder-push:
	@$(MAKE) -C go-builder push

.PHONY: dind-push
dind-push:
	@$(MAKE) -C dind push

.PHONY: kube-dind-push
kube-dind-push:
	@$(MAKE) -C kube-dind push

.PHONY: helm-push
helm-push:
	@$(MAKE) -C helm push	

.PHONY: toolbox-push
toolbox-push:
	@$(MAKE) -C toolbox push	

.PHONY: athenacli-push
athenacli-push:
	@$(MAKE) -C athenacli push	

.PHONY: git-secret-scanner-push
git-secret-scanner-push:
	@$(MAKE) -C  git-secret-scanner push	

.PHONY: python-builder-push
python-builder-push:
	@$(MAKE) -C python-builder push

.PHONY: gcloud-builder-push
gcloud-builder-push:
	@$(MAKE) -C gcloud-builder push

.PHONY: toolbox-build
toolbox-build:
	@$(MAKE) -C toolbox build	

.PHONY: go-builder-build
go-builder-build:
	@$(MAKE) -C go-builder build

.PHONY: dind-build
dind-build:
	@$(MAKE) -C dind build

.PHONY: kube-dind-build
kube-dind-build:
	@$(MAKE) -C kube-dind build

.PHONY: helm-build
helm-build:
	@$(MAKE) -C helm build	

.PHONY: athenacli-build
athenacli-build:
	@$(MAKE) -C athenacli build	

.PHONY: git-secret-scanner-build
git-secret-scanner-build:
	@$(MAKE) -C  git-secret-scanner build

.PHONY: python-builder-build
python-builder-build:
	@$(MAKE) -C python-builder build

.PHONY: gcloud-builder-build
gcloud-builder-build:
	@$(MAKE) -C gcloud-builder build


.PHONY: init-gcloud-cli
init-gcloud-cli:
ifneq ("$(wildcard $(GCLOUD_KEY_FILE))","")
	gcloud auth activate-service-account --key-file=$(GCLOUD_KEY_FILE)
else
	@echo $(GCLOUD_KEY_FILE) not present
endif