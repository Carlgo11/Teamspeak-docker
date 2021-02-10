FROM alpine
WORKDIR /teamspeak
RUN apk --force-refresh --no-cache --purge -f -u add curl jq wget bash libstdc++
RUN adduser -u 1000 -s /bin/bash -S teamspeak teamspeak
COPY --chown=1000 install.sh install.sh
RUN chmod 500 install.sh; chown 1000 /teamspeak -R; chmod 700 /teamspeak -R; mkdir files; chmod 700 /teamspeak/files
USER 1000
ENTRYPOINT [ "bash", "-c", "./install.sh; ./ts3server license_accepted=1 inifile=ts3server.ini" ]