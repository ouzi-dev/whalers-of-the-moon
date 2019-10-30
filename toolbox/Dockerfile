ARG GO_BUILDER_TAG=1.13.1

FROM quay.io/ouzi/go-builder:${GO_BUILDER_TAG}

ARG HELM_VERSION=v3.0.0-beta.4

ARG KUBECTL_VERSION=v1.16.2

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

RUN go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

RUN go get github.com/brancz/gojsontoyaml

RUN go get github.com/google/go-jsonnet/cmd/jsonnet

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && chmod +x /usr/local/bin/kubectl
