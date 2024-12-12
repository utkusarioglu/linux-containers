#!/bin/bash

# @purpose
# Installs packages from apt 

set -eux
bash --version

# apt_packages=(
#   git 
#   jq 
#   htop 
#   wget 
#   tree
#   bats
# )

# apt-get update
# apt-get upgrade -y
# apt-get install -y ${apt_packages[*]}
apt-get clean
apt-get autoremove --purge
rm -rf /var/log/apt/*
du -sh /var/cache/apt /var/lib/apt/lists

# for p in ${apt_packages[@]}; do
#   if [ -z $(which $p) ]; then
#     echo "Error: package $p not found"
#     exit 1
#   fi
#   echo "$p version information:"
#   $p --version
# done
