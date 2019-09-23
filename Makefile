.PHONY: go-builder-push dind-push

go-builder-push:
	$(MAKE) -C go-builder push

dind-push:
	$(MAKE) -C dind push

kube-dind-push:
	$(MAKE) -C kube-dind push