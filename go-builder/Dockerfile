ARG GOLANG_VERSION

FROM golang:${GOLANG_VERSION}-alpine3.16

ARG GOLANGCI_LINT_VERSION

RUN apk add --no-cache --update curl make bash git gcc libc-dev nodejs npm zip openssh \
    && npm config set unsafe-perm true \
    && npm install -g npm

RUN echo "${GOLANGCI_LINT_VERSION}"

RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v${GOLANGCI_LINT_VERSION}

RUN go install github.com/mitchellh/gox@latest

RUN go install golang.org/x/tools/cmd/goimports@latest

RUN go install github.com/golang/mock/mockgen@latest