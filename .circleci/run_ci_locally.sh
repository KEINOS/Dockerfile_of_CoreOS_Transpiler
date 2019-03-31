#!/usr/bin/env bash

echo ' Running Circle CI localy ...'
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

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $(dirname ${SCRIPT_DIR})
circleci build ${SCRIPT_DIR}/config.yml
