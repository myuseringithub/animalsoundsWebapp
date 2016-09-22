FROM node
# replace this with your application's default port
EXPOSE 80
WORKDIR /srv/projects/app/
RUN apt-get -y update && apt-get -y upgrade
ENTRYPOINT npm init --yes \
   && npm install express http-proxy os --save \
   && npm install http-proxy --save \
   && npm install url --save \
   && node index.html