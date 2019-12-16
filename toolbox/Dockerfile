ARG TF_VERSION
ARG GO_BUILDER_TAG
ARG HELM_VERSION

FROM hashicorp/terraform:${TF_VERSION} AS TF
FROM alpine/helm:${HELM_VERSION} AS HELM

FROM quay.io/ouzi/go-builder:${GO_BUILDER_TAG}

ARG AWS_CLI_VERSION
ARG CREDSTASH_VERSION
ARG GCLOUD_VERSION

RUN apk add --virtual build-deps build-base python-dev libffi-dev && apk add --purge --update \
  libressl-dev \
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
  python \
  py-pip \
  groff \
  less \
  mailcap \
  jq \
  && pip install --upgrade awscli==${AWS_CLI_VERSION} \ 
  && pip install --upgrade credstash==${CREDSTASH_VERSION} \
  && npm install -g npm \
  && apk -v --purge del build-deps \  
  && rm -rf /tmp/* /var/cache/apk/*

COPY --from=HELM /usr/bin/helm /bin/helm
COPY --from=TF /bin/terraform /bin/terraform

ARG KUBECTL_VERSION
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && mv kubectl /bin/kubectl \
    && chmod +x /bin/kubectl

RUN go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
RUN go get github.com/brancz/gojsontoyaml
RUN go get github.com/google/go-jsonnet/cmd/jsonnet

ARG GOTPL_VERSION
RUN wget -q https://github.com/belitre/gotpl/releases/download/${GOTPL_VERSION}/gotpl-${GOTPL_VERSION}-linux-amd64.zip \
    && unzip gotpl-${GOTPL_VERSION}-linux-amd64.zip \
    && mv linux-amd64/gotpl /bin/gotpl \
    && rm gotpl-${GOTPL_VERSION}-linux-amd64.zip \
    && rm -rf linux-amd64

RUN wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz \
    && tar -xzf google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz -C /etc \
    && bash /etc/google-cloud-sdk/install.sh 

ENV PATH="${PATH}:/etc/google-cloud-sdk/bin"

WORKDIR /tmp
