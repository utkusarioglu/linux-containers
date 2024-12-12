#!/bin/bash

# @purpose
# Installs packages from apt 

set -eux
bash --version

no_check="false"
allow_blank="false"

if [ $1 == "--no-check" ]; then
  no_check="true"
  shift
fi

if [ $1 == "--allow-blank" ]; then
  allow_blank="true"
  shift
fi

if [ ${allow_blank} == "true" ] && [ $# -eq 0 ]; then
  echo "Warning --allow-blank enabled with empty block, exiting"
  exit 0
fi

ARGS=(
  apt_packages
)

. ${0%/*}/parse-args.sh

apt-get install -y ${apt_packages}

if [ ${no_check} == "true" ]; then
  echo "Warning: --no-check enabled, exiting without checking installed software"
  exit 0
fi

for p in ${apt_packages[@]}; do
  if [ -z $(which $p) ]; then
    echo "Error: package $p not found"
    exit 1
  fi
  echo "$p version information:"
  $p --version
done
