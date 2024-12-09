#!/bin/bash
# This script requires a privileged user

set -eux
bash --version

ARGS=(
  root_pass
  username
  group_name
  user_id
  group_id
  home_abspath
)
# root_pass=${1:?'Root pass required as param #1'}
# username=${2:?'Username required as param #2'}
# group_name=${3:?'Group name required as param #3'}
# user_id=${4:?'User ID required as param #4'}
# group_id=${5:?'Group ID required as param #5'}

. ${0%/*}/args.sh

default_user=ubuntu
default_group=ubuntu
# home_abspath="/home/${username}"

getent group
getent passwd

echo "root:$root_pass" | chpasswd

userdel -r ${default_user}
groupdel ${default_group} || true

groupadd -g ${group_id} ${group_name}

useradd -m -u ${user_id} -g ${group_id} -s /bin/bash ${username}
mkdir -p ${home_abspath}
chown -R ${user_id}:${group_id} ${home_abspath}

# mv /home/${default_user} /home/${username}
# usermod -l ${username} ${default_user}

ls -al /home
# usermod -d /home/${username} -m ${username}

getent group
getent passwd
