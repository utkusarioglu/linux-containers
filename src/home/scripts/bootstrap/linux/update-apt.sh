#!/bin/bash

# @purpose
# Upgrades packages from apt 

set -euxo pipefail
bash --version

# TODO enable this. remove it from mamba-music container
# add-apt-repository universe

apt-get update
apt-get upgrade -y
