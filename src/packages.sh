set -e

yq_version="${1:?'Yq version not set'}"
nvim_version="${2:?'Nvim version not set'}"

# DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade
apt-get install -y \
  git \
  jq \
  htop \
  wget

# Yq requires manual retrieval of the package
echo "Installing yq:$yq_version…"
wget \
  https://github.com/mikefarah/yq/releases/download/$yq_version/yq_linux_amd64 \
  -O /usr/bin/yq && \
  chmod +x /usr/bin/yq

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
# chmod +x $nvim_path/nvim
nvim --version

# VScode folders that need to exist
mkdir -p $HOME/.vscode-server/extensions
mkdir -p $HOME/.vscode-server-insiders/extensions
