ARG PYTHON_VERSION=3.8.1

FROM python:${PYTHON_VERSION}-alpine3.11

RUN apk add --no-cache --update curl make bash git gcc g++ \
    libc-dev nodejs npm zip openssh \
    libffi-dev openssl-dev python3-dev \
    && npm config set unsafe-perm true \
    && npm install -g npm \
    && npm config set unsafe-perm false
