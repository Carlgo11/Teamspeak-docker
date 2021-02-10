#!/usr/bin/env bash

# Download latest ts3 server
url=$(curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"')
download=$(echo "$url"| sed -r 's/amd64/alpine/g')
wget "$download" -O teamspeak.tar.bz2

# Extract ts3server files
tar -xjf teamspeak.tar.bz2 --strip-components=1
mv redist/* .

# Clean up files
rm -rf {teamspeak.tar.bz2doc,serverquerydocs,CHANGELOG,LICENSE,ts3server_minimal_runscript.sh,ts3server_startscript.sh,redist}
chmod 500 {*.so,*.so.2,ts3server,sql,sql/*/}
