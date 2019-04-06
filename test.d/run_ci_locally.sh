#!/usr/bin/env bash

# Run this script to run test locally via CircleCI CLI
#

echo ' Running CircleCI locally ...'
echo '------------------------------'

# Check Docker
which docker > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo '- You need to install docker.'
    echo 'See: https://circleci.com/docs/ja/2.0/local-cli/'
    exit $LINENO
fi

# Check CircleCI CLI
which circleci > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo '- You need to install circleci CLI.'
    echo 'See: https://circleci.com/docs/ja/2.0/local-cli/'
    exit $LINENO
fi

# Move current directory
PATH_DIR_SCRIPT=$(cd $(dirname $0); pwd)
PATH_DIR_PARENT=$(dirname $PATH_DIR_SCRIPT)
cd $PATH_DIR_PARENT

# Run CircleCI CLI
circleci build ${PATH_DIR_PARENT}/.circleci/config.yml
