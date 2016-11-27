ShareMusic
===========
[![Build Status](https://travis-ci.org/pando85/sharemusic.svg?branch=master)](https://travis-ci.org/pando85/sharemusic)

This is a rewrite of CherryMusic based on Django and AngularJS.

You can test it at:
http://music.openrock.mooo.com/
* User: `test`
* Password: `1234`

Setup
-----
### Config file
Create `config.yml` with your music directories:
* One path:
```docker-compose
web:
  volumes:
    - /home/user/My Music:/usr/src/app/music:ro
```
* Multiple paths:
```docker-compose
web:
  volumes:
    - /home/user/Classic Music:/usr/src/app/music/Classic:ro
    - /home/user/Punk Music:/usr/src/app/music/Punk:ro
```

Add enviroment variables:
* SECRET_KEY: Django [secret key](https://docs.djangoproject.com/en/1.9/ref/settings/#std:setting-SECRET_KEY)
* DEBUG: show debug information in log.

Example `config.yml`:
```yml
web:
  volumes:
    - /home/user/My Music:/usr/src/app/music:ro
  environment:
    - SECRET_KEY=p0py3a&i7w^!#nfitarp&7p!0bj3j4!aez3huh)53!=ud128f(
    - DEBUG
    
nginx:
  ports:
    - "80:80"
```

### Install dependencies:
* [docker](https://docs.docker.com/engine/installation/)
* [docker-compose](https://docs.docker.com/compose/install/)>=1.5.0

Create containers:
```bash
docker-compose build
docker-compose up -d
```

**Note**: To run in production you will need to [Install bower components](#install-bower-components) and [Update static files](#update-static-files)

Initialice database:
```bash
docker-compose run --rm web python3 manage.py migrate auth
docker-compose run --rm web python3 manage.py migrate 
```

Default admin user: `admin/admin`

Reinstall ShareMusic
---------------------
```bash
docker-compose stop
docker-compose rm
```
And then reinstall.


Update ShareMusic
------------------
```bash
docker-compose stop
docker-compose rm web
docker-compose build
docker-compose up -d
```

Development frotent
-------------------
To install and run development containers:
```bash
docker-compose stop
docker-compose -f docker-compose.dev.yml build
docker-compose -f docker-compose.dev.yml up -d
```

Install bower components:
```bash
docker-compose -f docker-compose.dev.yml run  --rm web_dev python3 manage.py bower_install -- --allow-root
```
Update static files
-------------------
In development mode:
```bash
docker-compose -f docker-compose.dev.yml run --rm web_dev python3 manage.py collectstatic
```

Tests
-----

Test backend:
```bash
./test_scripts/run_tests.sh 
```