# Whalers of the moon

Just a bunch of dockerfiles

![Whalers of the moon](img/whalers.jpg)

## Dockerfiles

### go-builder

Docker image to build with go!

| Base Image | Entrypoint | Extras | Dockerfile |
|------------|------------|--------|------------|
|`golang:1.13.1-alpine3.10`| None | * curl<br> * make<br> * bash<br> * git<br> * nodejs<br> * npn<br> * golagci-lint<br> * gox<br> * goimports<br> * gomock<br> * mockgen<br> * zip| [Dockerfile](./go-builder/Dockerfile) |

#### build image

To build the image we have a [Makefile](./go-builder/Makefile), when running the targets we can set a different version for go, golangci-lint and the tag we create using environment variables:

* `GOLANG_VERSION`: Go version to use as base image. Default value: `1.13.1`
* `GOLANGCI_LINT_VERSION`: Version to install of `golangci-lint`. Default value: `1.21.0`
* `TAG`: Tag for the docker image, if not set `TAG` will use the same value as `GOLANG_VERSION`

Make targets:

* `make build`: Builds the docker image.
* `make push`: Push the image to the remote repository.

You can use `make go-builder-push` from the root folder and it will build the image with the default settings and push it to the repo.

### dind

Docker image to build docker images in docker!

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