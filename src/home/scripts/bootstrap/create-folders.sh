#!/bin/bash

# @purpose
# Creates folders that need to exist for the container to function
# as expected

set -eux
bash --version

ARGS=(
  user_id
  group_id
  home_abspath
)

. ${0%/*}/parse-args.sh

# VScode folders that need to exist
for suffix in "" "-insiders"; do
  abspath=${home_abspath}/.vscode-server${suffix}/extensions
  mkdir -p $abspath
  chown ${user_id}:${group_id} $abspath
done

ls -al ${home_abspath}
