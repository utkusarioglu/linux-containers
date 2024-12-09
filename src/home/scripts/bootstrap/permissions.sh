#!/bin/bash

# @purpose
# Adjusts permissions

ARGS=(
  user_id
  group_id
  home_abspath
)

. args.sh

chown -R ${user_id}:${group_id} ${home_abspath}/*

ls -alR ${home_abspath}
