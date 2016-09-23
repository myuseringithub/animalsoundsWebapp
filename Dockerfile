FROM node
# replace this with your application's default port
EXPOSE 80
WORKDIR /srv/projects/app/nodeServer

COPY ./nodeServer/ /srv/projects/app/nodeServer
COPY ./root/ /srv/projects/app/root

RUN apt-get -y update && apt-get -y upgrade
ENTRYPOINT npm install --yes \
   && node /srv/projects/app/nodeServer/server.js
