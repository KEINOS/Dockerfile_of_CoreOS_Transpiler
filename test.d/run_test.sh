#!/usr/bin/env sh
# ===============================
#  `ct` Command Transpiling Test
# ===============================
# This script runs the `ctP command and compares with the
# already outputted result.
#
# This script must be called within the `ct` docker container.
#

echo ' Running health check'
echo '======================'

echo -n '- Check ct command ... '
which ct > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo 'NG'
  echo 'No "ct" command found.'
  exit 1
fi
echo "OK ($(ct --version))"

# Define paths
PATH_DIR_SCRIPT=$(cd $(dirname $0); pwd)
NAME_FILE_YAML='sample_cl-config.yml'
NAME_FILE_JSON='sample_ignition.json'
PATH_FILE_YAML="${PATH_DIR_SCRIPT}/${NAME_FILE_YAML}"
PATH_FILE_JSON="${PATH_DIR_SCRIPT}/${NAME_FILE_JSON}"

# Run test
echo -n '- Comparing results ... '
result=$(ct -in-file $PATH_FILE_YAML)
control=$(cat $PATH_FILE_JSON)
if [ $result != $control ]; then
  echo 'NG'; echo 'The command result does not match with the test value.'
  exit 1
fi
echo 'OK'; exit 0
