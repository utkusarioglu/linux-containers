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

. ${0%/*}/args.sh

default_user=ubuntu
default_group=ubuntu

getent group
getent passwd

echo "root:$root_pass" | chpasswd

userdel -r ${default_user}
groupdel ${default_group} || true

groupadd -g ${group_id} ${group_name}

useradd -m -u ${user_id} -g ${group_id} -s /bin/bash ${username}
mkdir -p ${home_abspath}
chown -R ${user_id}:${group_id} ${home_abspath}

ls -al /home

getent group
getent passwd
