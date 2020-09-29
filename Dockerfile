FROM alpine
RUN mkdir /teamspeak
WORKDIR /teamspeak

RUN apk update > /dev/null; apk --no-cache add curl jq wget bash libstdc++
COPY install.sh install.sh
RUN chmod 500 install.sh
RUN addgroup -S teamspeak -g 1000 && adduser -u 1000 -s /bin/bash -S teamspeak -G teamspeak -H
RUN ./install.sh
RUN apk del curl jq wget
USER teamspeak
CMD bash -c "./ts3server_startscript.sh start license_accepted=1 inifile=ts3server.ini; sleep 1; tail -F /teamspeak/logs/ts3server_*.log"