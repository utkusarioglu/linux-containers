#!/bin/bash

# @purpose
# Adjusts permissions

set -eux

ARGS=(
  user_id
  group_id
  home_abspath
)
. /home/dev/scripts/utils/parse-args.sh

ls -alR ${home_abspath}

# Assigns the default user created by the script as the owner 
# of home directory files
chown -R ${user_id}:${group_id} ${home_abspath}/*

ls -alR ${home_abspath}
