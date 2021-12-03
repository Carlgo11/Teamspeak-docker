FROM alpine
RUN apk --force-refresh --no-cache --purge -f -u add curl jq libstdc++ && \
    adduser -u 1000 -S teamspeak teamspeak && \
    mkdir -p /teamspeak/files; chown 1000 /teamspeak/files
COPY --chown=1000:1000 entrypoint.sh entrypoint.sh
USER 1000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["license_accepted=1 inifile=ts3server.ini"]
