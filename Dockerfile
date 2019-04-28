FROM node:8-slim

ARG CLEVER_TOOLS_VERSION
RUN curl -o clever-tools.tar.gz https://clever-tools.cellar.services.clever-cloud.com/releases/${CLEVER_TOOLS_VERSION}/clever-tools-${CLEVER_TOOLS_VERSION}_linux.tar.gz
RUN mkdir -p ~/.local/bin
RUN tar -xvf clever-tools.tar.gz --strip-components=1 -C /usr/bin

RUN apt update && \
    apt install -y ssh make git

WORKDIR /app
CMD ["clever"]
