FROM  quay.io/ouzi/go-builder:1.13.1

ARG HELM_VERSION

RUN apk add --update ca-certificates wget git openssl bash make \
 && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["bash"]
CMD ["bash"]