#!/usr/bin/env sh
# ===============================
#  `ct` Command Transpiling Test
# ===============================
# This script runs the `ctP command and compares with the
# already outputted result.
#
# This script must be called within the `ct` docker container.
#

echo -n '- Check ct command ... '
which ct > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo 'NG'
  echo 'No "ct" command fount.'
  exit $LINENO
fi
ct --version

echo -n '- Comparing results ... '
PATH_DIR_SCRIPT=$(cd $(dirname $0); pwd)
result=$(ct -in-file $PATH_DIR_SCRIPT/sample_cl-config.yml)
control=$(cat $PATH_DIR_SCRIPT/sample_igniton.json)
if [ $result = $control ]; then
  echo 'NG'; echo 'The result of the command does not match with the test.'
  exit 1
fi
echo 'OK'; exit 0
