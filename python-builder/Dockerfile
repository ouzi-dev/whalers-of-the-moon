ARG PYTHON_VERSION=3.8.1

FROM python:${PYTHON_VERSION}-alpine3.11

RUN apk add --no-cache --update curl make bash git gcc libc-dev nodejs npm zip openssh \
    && npm config set unsafe-perm true \
    && npm install -g npm \
    && npm config set unsafe-perm false
