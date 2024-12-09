ARGS=(
  root_pass
  username
  group_name
  user_id
  group_id
)
# root_pass=${1:?'Root pass required as param #1'}
# username=${2:?'Username required as param #2'}
# group_name=${3:?'Group name required as param #3'}
# user_id=${4:?'User ID required as param #4'}
# group_id=${5:?'Group ID required as param #5'}

# echo "${ARGS[@]}"

. ./parse-args.sh

echo "root_pass $root_pass"
echo group_id $group_id
