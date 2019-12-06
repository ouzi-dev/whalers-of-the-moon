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