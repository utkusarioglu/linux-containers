#!/bin/bash

# @purpose
# Upgrades packages from apt 

set -euxo pipefail
bash --version

SOURCES=/etc/apt/sources.list.d/ubuntu.sources

sed -i '/^Components:/ {
    /universe/! s/$/ universe/
}' "$SOURCES"

apt-get update -o APT::Update::Error-Mode=any

# apt-get update
apt-get upgrade -y
