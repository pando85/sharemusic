#!/bin/bash
coverage run --source='./sharemusic/apps' manage.py test sharemusic.apps -v 2 && \
coverage report --skip-covered