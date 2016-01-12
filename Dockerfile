##
# Mosca Base Image for use in the Thor mqttBroker
#
# Build image with "docker build -t thor_mosca .
#
FROM node:4
# get dependancies for zmq
RUN apt-get update && apt-get install -y \
    libzmq3-dev \
    libkrb5-dev \
    pkg-config \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# move into our app dir
RUN mkdir /usr/app
WORKDIR /usr/app
# run npm install mosca and redis to save time later
RUN npm install redis@2.3 mosca@0.32.1
