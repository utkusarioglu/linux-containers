#!/bin/bash
# This script requires a privileged user

set -eux
bash --version

ARGS=(
  user_id
  group_id
  home_abspath
  root_pass
  username
  group_name
)

# . ${0%/*}/parse-args.sh
. /home/dev/scripts/util/parse-args.sh

getent group
getent passwd

# Alter root password
echo "root:$root_pass" | chpasswd

# Remove default user that comes with the base image
default_user=ubuntu
default_group=ubuntu
userdel -r ${default_user}
groupdel ${default_group} || true

# Create group and user for the normal operations
groupadd -g ${group_id} ${group_name}
useradd -m -u ${user_id} -g ${group_id} -s /bin/bash ${username}
mkdir -p ${home_abspath}
chown -R ${user_id}:${group_id} ${home_abspath}


ls -al /home
getent group
getent passwd
