FROM debian:jessie

MAINTAINER <stefan@dimitrov.li>

ENV PORT=8181
ENV HOST=0.0.0.0
ENV USERNAME=''
ENV PASSWORD=''


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install git curl build-essential python tmux -y

RUN git clone git://github.com/c9/core.git /root/c9sdk
RUN mkdir -p /root/.c9/node/bin/
ENV PATH=/root/.c9/node/bin/:$PATH
WORKDIR /root/c9sdk
RUN scripts/install-sdk.sh

RUN npm install -g forever

# clean cache
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm cache clean

RUN mkdir /workspace
VOLUME /workspace
EXPOSE $PORT

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]