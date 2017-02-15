# USAGE: 
# Current directory = project root.
# IMAGE=<nameofbuiltimage>
# docker build -t $IMAGE -f ./setup/server.dockerfile ./ && docker run -d -p 80:80 $IMAGE
FROM node
# replace this with your application's default port
# EXPOSE 80
WORKDIR /app/source/serverSide/nodeServer

COPY ./source /app/source/

RUN apt-get -y update && apt-get -y upgrade && \
    npm install --yes
CMD node /app/source/serverSide/nodeServer/server.js
