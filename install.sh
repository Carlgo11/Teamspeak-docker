#!/usr/bin/env bash

# Download latest ts3 server
download=`curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"'`
wget $download -O teamspeak.tar.bz2

# Create ts3 dir and unzip downloaded content
mkdir /teamspeak
tar -xjf teamspeak.tar.bz2
mv teamspeak3-server_linux_amd64/* /teamspeak
mkdir /teamspeak/{logs,files}
mv /teamspeak/redist/* /teamspeak/

# Set permissions and remove unused files
chown teamspeak:teamspeak /teamspeak -R
chmod 400 /teamspeak/*
chmod 500 /teamspeak/{*.so,*.so.2,ts3server_startscript.sh,files,sql,logs}
chmod 700 /teamspeak/{files,logs}/ -R
rm -rf /teamspeak/{doc,CHANGELOG,serverquerydocs, redist}

echo "Installation complete!"