FROM alpine
WORKDIR /teamspeak

RUN apk --force-refresh --no-cache --purge -f -u add curl jq wget bash libstdc++
RUN addgroup -S teamspeak -g 1000 && adduser -u 1000 -s /bin/bash -S teamspeak -G teamspeak -H
COPY --chown=1000:1000 install.sh install.sh
RUN chmod 500 install.sh; ./install.sh
RUN apk del curl jq wget
USER teamspeak
CMD bash -c "./ts3server_startscript.sh start license_accepted=1 inifile=ts3server.ini; sleep 1; tail -F /teamspeak/logs/ts3server_*.log"