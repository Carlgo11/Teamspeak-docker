#!/usr/bin/env bash

# Download latest ts3 server
url=$(curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"')
download=$(echo "$url"| sed -r 's/amd64/alpine/g')
wget "$download" -O teamspeak.tar.bz2

# Create ts3 dir and unzip downloaded content
tar -xjf teamspeak.tar.bz2 --strip-components=1
mkdir {logs,files}
mv redist/* ./

# Set permissions and remove unused files
chown teamspeak:teamspeak /teamspeak -R
chmod 400 ./* -R
chmod 500 ./{*.so,*.so.2,ts3server_startscript.sh,files,sql,logs}
chmod 700 ./{files,logs}/ -R
rm -rf {doc,CHANGELOG,serverquerydocs,redist}

echo "Installation complete!"