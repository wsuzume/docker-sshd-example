#!/bin/bash

# add below settings to your Dockerfile
# ---
# COPY ./second-hook.d/ /usr/local/bin/second-hook.d/
# 
# # Configure container entrypoint
# ENTRYPOINT ["tini", "-g", "--"]
# ---

if [ "$(id -u)" != 0 ]; then
    echo "docker-sshd-example/easy_install.sh must be run with root user."
    return 1
fi

apt-get update --yes
apt-get upgrade --yes
DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
    sudo git ca-certificates \
    # - `tini` is installed as a helpful container entrypoint,
    #   that reaps zombie processes and such of the actual executable we want to start
    #   See https://github.com/krallin/tini#why-tini for details
    tini \
    openssh-server
apt-get clean && rm -rf /var/lib/apt/lists/*

# for sshd
mkdir /var/run/sshd

# スタートアップスクリプト
git clone https://github.com/wsuzume/devel-entrypoint.git
cd devel-entrypoint
./install.sh
