export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade
apt-get install \
  git \
  jq \
  htop \
  wget

# Yq requires manual retrieval of the package
echo "Installing yq:$YQ_VERSION…"
wget \
  https://github.com/mikefarah/yq/releases/download/$YQ_VERSION/yq_linux_amd64 \
  -O /usr/bin/yq && \
  chmod +x /usr/bin/yq

# Neovim requires manual retrieval of the latest version
# as the apt package is quite old
echo "Installing neovim:$NVIM_VERSION…"
wget https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb \
  -O /neovim.deb
apt install -y /neovim.deb 
rm /neovim.deb

# VScode folders that need to exist
mkdir -p $HOME/.vscode-server/extensions
mkdir -p $HOME/.vscode-server-insiders/extensions
