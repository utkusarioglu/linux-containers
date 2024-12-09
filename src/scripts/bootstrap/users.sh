# This script requires a privileged user
set -eux

root_pass=${1:?'Root pass required as param #1'}
username=${2:?'Username required as param #2'}
group_name=${3:?'Group name required as param #3'}
user_id=${3:?'User ID required as param #4'}
group_id=${4:?'Group ID required as param #5'}
default_user=ubuntu
default_group=ubuntu
home_path="/home/${username}"

getent group
getent passwd

echo "root:$root_pass" | chpasswd

userdel -r ${default_user}
groupdel ${default_group} || true

groupadd -g ${group_id} ${group_name}

useradd -m -u ${user_id} -g ${group_id} -s /bin/bash ${username}
mkdir -p ${home_path}
chown -R ${user_id}:${group_id} ${home_path}

# mv /home/${default_user} /home/${username}
# usermod -l ${username} ${default_user}

ls -al /home
# usermod -d /home/${username} -m ${username}

getent group
getent passwd
