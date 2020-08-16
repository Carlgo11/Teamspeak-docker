FROM alpine:latest
WORKDIR /teamspeak

RUN apk --no-cache add curl jq wget bash libstdc++
COPY --chown=root install.sh /teamspeak/install.sh
RUN addgroup -S teamspeak && adduser -s /bin/bash -S teamspeak -G teamspeak
RUN ./install.sh; rm ./install.sh
RUN apk --no-cache del curl jq wget

USER teamspeak
CMD bash -c "./ts3server_startscript.sh start license_accepted=1 inifile=ts3server.ini; sleep 1; tail -F /teamspeak/logs/ts3server_*.log"