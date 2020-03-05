ARG TF_VERSION
ARG GO_BUILDER_TAG

FROM hashicorp/terraform:${TF_VERSION} AS TF

FROM quay.io/ouzi/go-builder:${GO_BUILDER_TAG}

ARG AWS_CLI_VERSION
ARG CREDSTASH_VERSION
ARG GCLOUD_VERSION
ARG HELM_VERSION

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
    && npm config set unsafe-perm true \
    && npm install -g npm \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin \
    && apk -v --purge del build-deps \  
    && rm -rf /tmp/* /var/cache/apk/* \
    && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

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

ARG YQ_VERSION
RUN wget -O /bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" \
    && chmod +x /bin/yq

ENV PATH="${PATH}:/etc/google-cloud-sdk/bin"

WORKDIR /tmp
