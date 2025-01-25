#!/bin/bash

echo "ENVS: ${ENVS[@]}"

for e in ${ENVS[@]}; do
  : ${!e:?"Environment variable '${e}' is required"}
done
