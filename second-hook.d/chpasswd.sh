#!/bin/bash

echo "Random password set: ${INIT_USER}"
PASSWORD=$(openssl rand -base64 12)
echo "${INIT_USER}:${PASSWORD}" | chpasswd