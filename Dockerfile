ARG CLEVER_TOOLS_VERSION
FROM node:8-slim

RUN curl -o clever-tools.tar.gz https://clever-tools.cellar.services.clever-cloud.com/releases/$CLEVER_TOOLS_VERSION/clever-tools-$CLEVER_TOOLS_VERSION_linux.tar.gz
RUN mkdir -p ~/.local/bin
RUN tar -xvf clever-tools.tar.gz --strip-components=1 -C /usr/bin

RUN apt update && \
    apt install -y ssh

WORKDIR /app
CMD ["clever"]
