wget -O /bootstrap/create-env-example.sh \
  https://gist.githubusercontent.com/utkusarioglu/2d4be44dc7707afccd540ad99ba385e6/raw/create-env-example.sh

wget -O $HOME/.bashrc \
  https://gist.githubusercontent.com/utkusarioglu/3523b00578807d63b05399fe57a4b2a7/raw/.bashrc

ADD --chown=$USERNAME:$GROUP \
wget -O $HOME/.inputrc \
  https://gist.githubusercontent.com/utkusarioglu/d5c216c744460c45bf6260d0de4131b4/raw/.inputrc \

# Elam
elam_path=$HOME/elam
git clone https://github.com/utkusarioglu/elam.git $elam_path
echo "alias elam=$elam_path/elam.sh" >> $HOME/.bash_aliases
