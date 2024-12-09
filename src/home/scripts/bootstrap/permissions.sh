#!/bin/bash

# @purpose
# Adjusts permissions

ls -alR ${home_abspath}

ARGS=(
  user_id
  group_id
  home_abspath
)

. ${0%/*}/args.sh

chown -R ${user_id}:${group_id} ${home_abspath}/*

ls -alR ${home_abspath}
