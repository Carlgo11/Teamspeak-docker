FROM alpine
WORKDIR /teamspeak
RUN apk --force-refresh --no-cache --purge -f -u add curl jq wget libstdc++
RUN adduser -u 1000 -S teamspeak teamspeak
COPY --chown=1000 install.sh install.sh
RUN chmod 500 install.sh; chown 1000 /teamspeak -R; chmod 700 /teamspeak -R
USER 1000
ENTRYPOINT [ "sh", "-c", "./install.sh; ls -la files; ./ts3server license_accepted=1 inifile=ts3server.ini" ]