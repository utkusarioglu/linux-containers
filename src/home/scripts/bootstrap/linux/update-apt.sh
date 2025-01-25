#!/bin/bash

# @purpose
# Upgrades packages from apt 

set -euxo pipefail
bash --version

apt-get update
apt-get upgrade -y
