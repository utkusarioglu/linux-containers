set -eux

ARGS=(
  yq_version
  nvim_version
  home_path
)

. args.sh

apt-get update
apt-get upgrade
apt-get install -y \
  git \
  jq \
  htop \
  wget \
  tree

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
echo 'Following path should be clear of nvim files:'
ls -al
echo 'Nvim version:'
nvim --version

# VScode folders that need to exist
mkdir -p $HOME/.vscode-server/extensions
mkdir -p $HOME/.vscode-server-insiders/extensions
