#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
REPO_PATH="$( dirname $DIR)"

cd $REPO_PATH

if [ ! -f config.yml ]; then
    cp config.example.yml config.yml
fi

docker build ./web -t sharemusic:test
docker-compose -f docker-compose.test.yml build
docker-compose -f docker-compose.test.yml up -d

while ! docker-compose -f docker-compose.test.yml run -T --rm web_test psql --host=postgres \
    --username=postgres -c 'SELECT 1'; do
  echo 'Waiting for postgres...'
  sleep 1;
done;

docker-compose -f docker-compose.test.yml run --rm web_test /usr/src/test.sh && \
docker-compose -f docker-compose.test.yml stop && docker-compose -f docker-compose.test.yml rm -f