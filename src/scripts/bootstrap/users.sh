# This script requires a privileged user
set -eux

root_pass=${1:?'Root pass required as param #1'}
username=${2:?'Username required as param #2'}
user_id=${3:?'User ID required as param #3'}
group_id=${4:?'Group ID required as param #4'}
default_user=ubuntu
home_path="/home/${username}"

echo "root:$root_pass" | chpasswd

userdel -r ${default_user}
useradd -m -u ${user_id} -g ${group_id} -s /bin/bash ${username}
mkdir -p ${home_path}
chown -R ${user_id}:${group_id} ${home_path}

# mv /home/${default_user} /home/${username}
# usermod -l ${username} ${default_user}

ls -al /home
# usermod -d /home/${username} -m ${username}
