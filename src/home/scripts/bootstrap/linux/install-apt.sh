#!/bin/bash

# @purpose
# Installs packages from apt 

set -euxo pipefail
bash --version

no_check="false"

if [ $1 == "--no-check" ]; then
  no_check="true"
  shift
fi

if [ ${1:-'none'} == 'none' ]; then
  echo "Warning: First arg empty, exiting"
  exit 0
fi

ARGS=(
  apt_packages
)
. /home/dev/scripts/utils/parse-args.sh

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
