.PHONY: go-builder-push dind-push

go-builder-push:
	$(MAKE) -C go-builder push

dind-push:
	$(MAKE) -C dind build