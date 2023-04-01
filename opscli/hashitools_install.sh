#!/bin/bash

HASHI_APP=${1:-packer}
APP_VERSION=${2:-latest}
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
MACHINE=$(uname -m)
case "$MACHINE" in
    x86_64)  ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    arm[5-7]*) ARCH="arm" ;;
    *) echo >&2 "error: unsupported architecture ($MACHINE)"; exit 1 ;;    
esac;
HASHI_URL=$(curl -s "https://api.releases.hashicorp.com/v1/releases/${HASHI_APP}/${APP_VERSION}" | jq -Mr ".builds[] | select(.arch == \"${ARCH}\" and .os == \"${OS}\") | .url")

curl -s ${HASHI_URL} -o "/tmp/${HASHI_APP}.zip" \
    && unzip -q -d /tmp/ /tmp/${HASHI_APP}.zip \
    && mv /tmp/${HASHI_APP} /usr/local/bin/${HASHI_APP} \
    && rm -fv /tmp/${HASHI_APP}.zip \
