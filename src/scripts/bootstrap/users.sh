# This script requires a privileged user
set -eux

root_pass=${1:?'Root pass required as param #1'}
username=${1:?'Username required as param #2'}
default_user=ubuntu

echo "root:$root_pass" | chpasswd

mv /home/${default_user} /home/${username}
usermod -l ${username} ${default_user}
usermod -d /home/${username} -m ${username}
