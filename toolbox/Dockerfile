ARG GO_BUILDER_TAG=1.13.1

FROM  quay.io/ouzi/go-builder:${GO_BUILDER_TAG}

ARG HELM_VERSION=v3.0.0-beta.4

RUN apk add --purge --update \
  ca-certificates \
  wget \
  git \
  curl \
  wget \
  openssl \
  bash \
  make \
  nodejs \
  npm \
  zip \
  tar \
  && rm -rf /tmp/* /var/cache/apk/*

RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz