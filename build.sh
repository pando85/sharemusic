#!/bin/bash

docker-compose build
docker-compose -f docker-compose.dev.yml build

docker-compose -f docker-compose.dev.yml run  --rm web_dev python3 manage.py bower_install -- --allow-root
docker-compose -f docker-compose.dev.yml run --rm web_dev python3 manage.py collectstatic --noinput

docker build -t pando85/sharemusic web/

# docker login --username=
# docker push pando85/sharemusic