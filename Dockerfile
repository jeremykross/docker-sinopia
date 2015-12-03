FROM library/ubuntu:14.04

MAINTAINER ContainerShip Developers <developers@containership.io>

# set environment variables
ENV SINOPIA_VERSION 1.4.0

# install dependencies
RUN apt-get update
RUN apt-get install curl npm -y

# install npm & node
RUN npm install -g n
RUN n 0.10.38

# install dependencies
RUN npm install -g sinopia@$SINOPIA_VERSION

# add config
ADD sinopia.conf sinopia.conf

# Execute the run script in foreground mode
CMD sinopia -l 0.0.0.0:$PORT -c /sinopia.conf
