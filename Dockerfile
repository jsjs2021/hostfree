FROM node:20-bookworm-slim

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl iproute2 netcat-openbsd && \
    rm -rf /var/lib/apt/lists/* && \
    addgroup --gid 10008 choreo && \
    adduser --disabled-password --no-create-home --uid 10008 --ingroup choreo choreouser && \
    usermod -aG sudo choreouser && \
    chmod +x index.js swith web server && \
    npm install

CMD [ "node", "index.js" ]

USER 10008
