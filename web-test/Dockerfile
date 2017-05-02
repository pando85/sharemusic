FROM pando85/sharemusic:latest

RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib && \
    rm -rf /var/lib/apt/lists/*

ADD ./test-requirements.txt /usr/src/
RUN pip3 install -r /usr/src/test-requirements.txt

ADD ./test*.sh /usr/src/
