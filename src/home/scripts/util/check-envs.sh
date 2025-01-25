#!/bin/bash

echo "ENVS: ${ARGS[@]}"

for e in ${ENVS[@]}; do
  : ${!e:?"Environment variable '${e}' is required"}
done
