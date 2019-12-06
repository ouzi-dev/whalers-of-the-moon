# Whalers of the moon <!-- omit in toc -->

Just a bunch of dockerfiles - hosted in https://quay.io/organization/ouzi 

![Whalers of the moon](img/whalers.jpg)

- [Dockerfiles](#dockerfiles)
  - [go-builder](#go-builder)
    - [build image](#build-image)
  - [dind](#dind)
    - [build image](#build-image-1)
  - [kube-dind](#kube-dind)
    - [build image](#build-image-2)
    - [Container example with Prow](#container-example-with-prow)
  - [helm](#helm)
    - [build image](#build-image-3)
  - [toolbox](#toolbox)
    - [build image](#build-image-4)
  - [athena cli](#athena-cli)
    - [build image](#build-image-5)

## Dockerfiles

### go-builder

Docker image to build with go!

[![Docker Repository on Quay](https://quay.io/repository/ouzi/go-builder/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/go-builder)

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`golang:1.13.4-alpine3.10`| None | * curl<br> * make<br> * bash<br> * git<br> * nodejs<br> * npn<br> * golagci-lint<br> * gox<br> * goimports<br> * gomock<br> * mockgen<br> * zip| [Dockerfile](./go-builder/Dockerfile) |

#### build image

To build the image we have a [Makefile](./go-builder/Makefile), when running the targets we can set a different version for go, golangci-lint and the tag we create using environment variables:

* `GOLANG_VERSION`: Go version to use as base image. Default value: `1.13.4`
* `GOLANGCI_LINT_VERSION`: Version to install of `golangci-lint`. Default value: `1.21.0`
* `TAG`: Tag for the docker image, if not set `TAG` will use the same value as `GOLANG_VERSION`

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make go-builder-push` from the root folder and it will build the image with the default settings and push it to the repo.

### dind

Docker image to build docker images in docker!

[![Docker Repository on Quay](https://quay.io/repository/ouzi/dind/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/dind)

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`docker:stable-dind`| `dockerd-entrypoint.sh` | * curl<br> * make<br> * bash<br> * git<br> * python<br> * pip<br> * aws-cli | [Dockerfile](./dind/Dockerfile) |

#### build image

To build the image we have a [Makefile](./dind/Makefile), when running the targets we can set a different version for docker and the tag we create using environment variables:

* `DOCKER_VERSION`: Docker version to use as base image. Default value: `stable`

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make dind-push` from the root folder and it will build the image with the default settings and push it to the repo.


### kube-dind

Docker image to build docker images in docker with Prow!

[![Docker Repository on Quay](https://quay.io/repository/ouzi/kube-dind/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/kube-dind)

__IMPORTANT: This image is to use with Prow, and you need to use ALWAYS as start command: `runner.sh` and the container needs `privileged` permissions!__

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`debian:stretch`| None | * docker | [Dockerfile](./kube-dind/Dockerfile) |

#### build image

To build the image we have a [Makefile](./kube-dind/Makefile), when running the targets we can set a different version for docker and the tag we create using environment variables:

* `DOCKER_VERSION`: Docker version to use as base image. Default value: `18.09`

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make kube-dind-push` from the root folder and it will build the image with the default settings and push it to the repo.

#### Container example with Prow

```
containers:
- name: "build-kube-dind-image"
  imagePullPolicy: Always
  image: belitre/kube-dind
  command:
    - runner.sh
  args:
    - make
    - kube-dind-push
  securityContext:
    privileged: true
```

### helm

Docker image for helm

[![Docker Repository on Quay](https://quay.io/repository/ouzi/helm/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/helm)

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`alpine:3.10`| None | None | [Dockerfile](./helm/Dockerfile) |

#### build image

To build the image we have a [Makefile](./helm/Makefile), when running the targets we can set a different version for go-builder and helm and the tag we create using environment variables:

* `HELM_VERSION`: Version to install of `helm`. Default value: `v3`
* `TAG`: Tag for the docker image

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make toolbox-push` from the root folder and it will build the image with the default settings and push it to the repo.

### toolbox

Docker image that we use as a toolbox

[![Docker Repository on Quay](https://quay.io/repository/ouzi/toolbox/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/toolbox)

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`quay.io/ouzi/go-builder`| None | * curl<br> * wget<br> * ca-certificates<br> * make<br> * bash<br> * git<br> * nodejs<br> * npm<br> * tar<br> * zip<br> * helm<br> * kubectl<br> * jb<br> * gojsontoyaml<br> * jsonnet| [Dockerfile](./toolbox/Dockerfile) |

#### build image

To build the image we have a [Makefile](./toolbox/Makefile), when running the targets we can set a different version for go-builder and helm and the tag we create using environment variables:

* `GO_BUILDER_TAG`: Go-Builder tag to use as base image. Default value: `1.13.4`
* `HELM_VERSION`: Version to install of `helm`. Default value: `v3`
* `KUBECTL_VERSION`: Version to install of `kubectl`. Default value: `v1.16.2`
* `TAG`: Tag for the docker image

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make toolbox-push` from the root folder and it will build the image with the default settings and push it to the repo.

### athena cli

Docker image that we use as for running AWS Athena queries 

[![Docker Repository on Quay](https://quay.io/repository/ouzi/athenacli/status "Docker Repository on Quay")](https://quay.io/repository/ouzi/athenacli)

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`python:3.8.0-alpine`| /usr/local/bin/athenacli | | [Dockerfile](./athenacli/Dockerfile) |

#### build image

To build the image we have a [Makefile](./athenacli/Makefile), when running the targets we can set a different version for the AthenaCLI and the tag we create using environment variables:

* `ATHENACLI_VERSION`: Version to install of `[athenacli](https://github.com/dbcli/athenacli)`. Default value: `0.1.4`
* `TAG`: Tag for the docker image

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make athenacli-push` from the root folder and it will build the image with the default settings and push it to the repo.
