#!/usr/bin/env bash

cd /teamspeak
./ts3server_startscript.sh start license_accepted=1 inifile=ts3server.ini
tail -F /teamspeak/logs/ts3server_*.log