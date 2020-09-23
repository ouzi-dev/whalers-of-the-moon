FROM ubuntu:focal

ARG HELM_VERSION

RUN apt update && apt install software-properties-common curl make -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64 && \
    add-apt-repository ppa:rmescandon/yq && \
    apt-add-repository https://cli.github.com/packages && \
    apt update  && \
    apt install -y gh yq

RUN curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 

ENTRYPOINT ["helm"]
CMD ["help"]
