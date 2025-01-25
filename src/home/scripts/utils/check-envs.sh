#!/bin/bash

# @purpose
# Checks whether the environment variables presented in `ENVS`
# have been defined

echo "ENVS: ${ENVS[@]}"

for e in ${ENVS[@]}; do
  : ${!e:?"Environment variable '${e}' is required"}
done
