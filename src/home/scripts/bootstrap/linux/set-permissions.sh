#!/bin/bash

# @purpose
# Adjusts permissions

set -eux

ARGS=(
  user_id
  group_id
  home_abspath
)

# . ${0%/*}/parse-args.sh
. /home/dev/scripts/util/parse-args.sh

ls -alR ${home_abspath}

# Assigns the default user created by the script as the owner 
# of home directory files
chown -R ${user_id}:${group_id} ${home_abspath}/*

ls -alR ${home_abspath}
