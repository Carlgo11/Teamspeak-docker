#!/usr/bin/env bash
download=`curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"'`
wget $download -O teamspeak.tar.bz2

mkdir /teamspeak
tar -xjf teamspeak.tar.bz2
mv teamspeak3-server_linux_amd64/* /teamspeak
mkdir /teamspeak/{logs,files}
chown teamspeak:teamspeak /teamspeak -R
chmod 400 /teamspeak/*
chmod 500 /teamspeak/{*.so,ts3server_startscript.sh,files,sql,logs}
chmod 700 /teamspeak/{files,logs}/ -R
rm -rf /teamspeak/{doc,CHANGELOG,serverquerydocs,query_ip_blacklist.txt,query_ip_whitelist.txt}
echo "TS3 installed!"