FROM python:3.8.0-alpine

ARG ATHENACLI_VERSION
RUN pip install athenacli==${ATHENACLI_VERSION}

ENTRYPOINT [ "/usr/local/bin/athenacli" ]