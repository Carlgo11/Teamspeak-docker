#!/usr/bin/env bash

# Download latest ts3 server
url=$(curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"')
download=$(echo "$url"| sed -r 's/amd64/alpine/g')
wget "$download" -O teamspeak.tar.bz2

# Extract ts3server files
tar -xjf teamspeak.tar.bz2 --strip-components=1
mv redist/* ./

# Create directories
mkdir ./{files,logs}

# Set permissions
chown 1000:1000 -R ./{.,files,logs}
chmod 400 -R ./*
chmod 500 ./{*.so,*.so.2,ts3server_startscript.sh,ts3server,sql,sql/*/}
chmod 700 -R ./{files,logs}

# Remove unused files
rm -rf {doc,CHANGELOG,serverquerydocs,redist,teamspeak.tar.bz2,install.sh}
