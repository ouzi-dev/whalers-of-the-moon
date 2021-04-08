ARG GOLANG_VERSION

FROM golang:${GOLANG_VERSION}-alpine3.13

ARG GOLANGCI_LINT_VERSION

RUN apk add --no-cache --update curl make bash git gcc libc-dev nodejs npm zip openssh \
    && npm config set unsafe-perm true \
    && npm install -g npm

RUN echo "${GOLANGCI_LINT_VERSION}"

RUN GO111MODULE=on go get -u github.com/golangci/golangci-lint/cmd/golangci-lint@v${GOLANGCI_LINT_VERSION}

RUN go get -u github.com/mitchellh/gox

RUN go get golang.org/x/tools/cmd/goimports

RUN go get github.com/golang/mock/gomock

RUN go install github.com/golang/mock/mockgen