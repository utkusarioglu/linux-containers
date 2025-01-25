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

# . ${0%/*}/parse-args.sh
. /home/dev/scripts/util/parse-args.sh

# VScode folders that need to exist
echo "Creating VScode folders"
for suffix in "" "-insiders"; do
  abspath=${home_abspath}/.vscode-server${suffix}/extensions
  echo "Creating: $abspath"
  mkdir -p $abspath
  # parent of abspath is the target here
  chown -R ${user_id}:${group_id} ${abspath%/*}
done

ls -al ${home_abspath}
