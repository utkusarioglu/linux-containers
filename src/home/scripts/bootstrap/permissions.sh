#!/bin/bash

# @purpose
# Adjusts permissions

set -eux

ARGS=(
  user_id
  group_id
  home_abspath
)

. ${0%/*}/args.sh

ls -alR ${home_abspath}

chown -R ${user_id}:${group_id} ${home_abspath}/*

ls -alR ${home_abspath}
