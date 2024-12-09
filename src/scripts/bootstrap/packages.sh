#!/bin/bash

# @purpose
# Installs packages from apt and manual sources

set -eux
bash --version

ARGS=(
  yq_version
  nvim_version
  home_abspath
)

. args.sh

versioned_packages=(
  git 
  jq 
  htop 
  wget 
  tree
)

apt-get update
apt-get upgrade -y
apt-get install -y ${versioned_packages[*]}

for p in ${versioned_packages[@]}; do
  $p --version
done

# Yq requires manual retrieval of the package
echo "Installing yq:$yq_version…"
wget https://github.com/mikefarah/yq/releases/download/$yq_version/yq_linux_amd64 \
  -O /usr/bin/yq
chmod +x /usr/bin/yq
yq --version

# Neovim requires manual retrieval of the latest version
# as the apt package is quite old
echo "Installing neovim:$nvim_version…"
nvim_path=/usr/bin
nvim_gz_path=./nvim.tar.gz
wget https://github.com/neovim/neovim/releases/download/$nvim_version/nvim-linux64.tar.gz \
  -O $nvim_gz_path
mkdir -p $nvim_path
tar -xzvf nvim.tar.gz
mv ./nvim-linux64/bin/nvim $nvim_path/nvim
rm -rf nvim_gz_path ./nvim-linux64
echo 'Following path should be clear of nvim files:'
ls -al
nvim --version

# VScode folders that need to exist
mkdir -p ${home_abspath}/.vscode-server/extensions
mkdir -p ${home_abspath}/.vscode-server-insiders/extensions

ls -al ${home_abspath}
