#!/bin/bash

arg_count=${#ARGS[@]}
param_count=$#

echo "ARGS: ${ARGS[@]}"

if [ $param_count -gt $arg_count ]; then
  echo "Error: script given ${param_count} params while it only needs ${arg_count}"
  exit 2
fi

counter=0
for v in ${ARGS[@]}; do
  counter=$(( counter + 1 ))
  err="'$v' has to be param #${counter}"
  declare "$v=${1:?$err}"
  shift
done
