FROM ubuntu:22.04

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --yes \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends \
        sudo git ca-certificates \
        # - `tini` is installed as a helpful container entrypoint,
        #   that reaps zombie processes and such of the actual executable we want to start
        #   See https://github.com/krallin/tini#why-tini for details
        tini \
        openssh-server \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# for sshd
RUN mkdir /var/run/sshd

# スタートアップスクリプト
RUN git clone https://github.com/wsuzume/devel-entrypoint.git \
    && cd devel-entrypoint \
    && /bin/bash install.sh

COPY ./second-hook.d/ /usr/local/bin/second-hook.d/

# Configure container entrypoint
ENTRYPOINT ["tini", "-g", "--"]
