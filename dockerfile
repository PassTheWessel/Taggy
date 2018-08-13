FROM dockerfile/ubuntu
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*
VOLUME ["/data/db"]
WORKDIR /data
CMD ["mongod"]
EXPOSE 27017
EXPOSE 28017

FROM node:8
LABEL name "Taggy: Discord tag Bot"
LABEL version "0.1.0"
LABEL maintainer "Wesselgame (Wessel Tip) <discord@go2it.eu>"
COPY package*.json .
COPY yarn*.lock *
RUN npm install -g pm2 yarn
RUN yarn install
COPY . .
CMD ["cd", "src", "&&", "pm2", "start", "taggy.js", "--name=\"Taggy\""]