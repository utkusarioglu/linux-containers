#!/bin/bash

# @purpose
# Does apt and dpkg related cleaning on the system

set -euxo pipefail
bash --version

apt-get clean

apt-get autoremove --purge

rm -rf /var/log/apt/*

du -sh /var/cache/apt /var/lib/apt/lists

dpkg --get-selections \
  | grep deinstall \
  | awk '{ print $1 }' \
  | xargs dpkg --purge \
  || true

# for p in ${apt_packages[@]}; do
#   if [ -z $(which $p) ]; then
#     echo "Error: package $p not found"
#     exit 1
#   fi
#   echo "$p version information:"
#   $p --version
# done
