FROM pando85/sharemusic:latest

RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g bower less yuglify
RUN ln -s /usr/bin/nodejs /usr/bin/node
