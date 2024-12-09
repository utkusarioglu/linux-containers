#!/bin/bash

set -eux

ARGS=(
  home_abspath
)

. args.sh

base=https://gist.githubusercontent.com/utkusarioglu
scripts_abspath=${home_abspath}/scripts

mkdir ${scripts_abspath}

# # Create env example
# wget -O ${scripts_abspath}/create-env-example.sh \
#   ${base}/2d4be44dc7707afccd540ad99ba385e6/raw/create-env-example.sh
# chmod +x ${scripts_abspath}/create-env-example.sh

# # RC files
# wget -O ${home_abspath}/.bashrc ${base}/3523b00578807d63b05399fe57a4b2a7/raw/.bashrc
# wget -O ${home_abspath}/.inputrc ${base}/d5c216c744460c45bf6260d0de4131b4/raw/.inputrc

# Elam
elam_path=${home_abspath}/elam
git clone --depth 1 https://github.com/utkusarioglu/elam.git $elam_path
echo "alias elam=$elam_path/elam.sh" >> ${home_abspath}/.bash_aliases
