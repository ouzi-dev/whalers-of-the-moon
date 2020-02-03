ARG DOCKER_VERSION=stable

FROM docker:${DOCKER_VERSION}-dind

RUN apk add --no-cache --update curl make bash git \
    python python-dev py-pip build-base \
    nodejs npm

RUN pip install awscli --upgrade

ENTRYPOINT ["dockerd-entrypoint.sh"]
