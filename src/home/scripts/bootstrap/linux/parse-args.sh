#!/bin/bash

# @purpose
# Creates variables using the variable names from `ARGS` and 
# values from the positional parameters
# Throws if the script is provided with more or less params than `ARGS`

arg_count=${#ARGS[@]}
param_count=$#

echo "ARGS: ${ARGS[@]}"

# Checks if more params than what is required is given to the script
if [ $param_count -gt $arg_count ]; then
  echo "Error: script given ${param_count} params while it only needs ${arg_count}"
  exit 2
fi

# Assings positional param to args
# It throws if params fall short of `ARGS`
counter=0
for v in ${ARGS[@]}; do
  counter=$(( counter + 1 ))
  err="'$v' has to be param #${counter}"
  declare "$v=${1:?$err}"
  shift
done
