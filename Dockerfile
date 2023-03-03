FROM node:16.14

ENV USER=root

# install python and make
RUN apt-get update && \
	apt-get install -y python3 build-essential && \
	apt-get purge -y --auto-remove

# create evobot user
#RUN groupadd -r root && \
#	useradd --create-home --home /home/evobot -r -g root root

# set up volume and user
USER root
WORKDIR /home/evobot

COPY --chown=root:root package*.json ./
RUN npm install
VOLUME [ "/home/evobot" ]

COPY --chown=root:root  . .

ENTRYPOINT [ "npm", "run", "prod" ]
