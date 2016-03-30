FROM sharemusic_web

RUN apt-get update && apt-get install -y postgresql postgresql-contrib

ADD ./test-requirements.txt /usr/src/
RUN pip3 install -r /usr/src/test-requirements.txt

ADD ./test*.sh /usr/src/
