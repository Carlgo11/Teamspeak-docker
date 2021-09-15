FROM alpine
WORKDIR /teamspeak
RUN apk --force-refresh --no-cache --purge -f -u add curl jq wget libstdc++
RUN adduser -u 1000 -S teamspeak teamspeak
COPY install.sh install.sh
RUN chown 1000 /teamspeak -R; chmod 700 /teamspeak -R; chmod 500 install.sh
RUN mkdir /teamspeak/files
RUN chown 1000 /teamspeak/files -R
USER 1000
ENTRYPOINT [ "sh", "-c", "./install.sh; ./ts3server license_accepted=1 inifile=ts3server.ini" ]
