#!/bin/bash

set -eux

ARGS=(
  home_abspath
)

. ${0%/*}/args.sh

# Elam
elam_path=${home_abspath}/elam
git clone --depth 1 https://github.com/utkusarioglu/elam.git $elam_path
echo "alias elam=$elam_path/elam.sh" >> ${home_abspath}/.bash_aliases
