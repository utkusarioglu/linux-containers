#!/bin/bash

# @purpose
# Upgrades packages from apt 

set -euxo pipefail
bash --version

add-apt-repository -y universe

apt-get update
apt-get upgrade -y
