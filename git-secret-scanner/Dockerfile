FROM alpine:3.16

RUN apk add --no-cache --update  \
    make \
    git \
    bash

# install the AWS Git Secrets tool
WORKDIR /etc
ARG AWS_GIT_SECRETS_VERSION
RUN git clone --branch ${AWS_GIT_SECRETS_VERSION} https://github.com/awslabs/git-secrets.git && \ 
    cd git-secrets && \
    make install && \
    git-secrets --register-aws

WORKDIR /tmp