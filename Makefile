.PHONY: go-builder-push dind-push helm-push

go-builder-push:
	$(MAKE) -C go-builder push

dind-push:
	$(MAKE) -C dind push

kube-dind-push:
	$(MAKE) -C kube-dind push

helm-push:
	$(MAKE) -C helm push	

toolbox-build:
	$(MAKE) -C toolbox build	

toolbox-push:
	$(MAKE) -C toolbox push	
