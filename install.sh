#!/usr/bin/env sh

umask 0077

# Download latest ts3 server
url=$(curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"')
download=$(echo "$url"| sed -r 's/amd64/alpine/g')
wget -q "$download" -O teamspeak.tar.bz2

# Extract ts3server files
tar -xjf teamspeak.tar.bz2 --strip-components=1

# Set up directory
[ -d "redist" ] && mv redist/* .
[ -d "files" ] || mkdir files

# Set up database config
cat <<- EOF >ts3db_mariadb.ini
		[config]
		host='${MARIADB_HOST}'
		port='${MARIADB_PORT:-3306}'
		username='${MARIADB_USER}'
		password='${MARIADB_PASSWORD}'
		database='${MARIADB_DATABASE}'
		socket='${MARIADB_SOCKET}'
		wait_until_ready='${TS3SERVER_DB_WAITUNTILREADY:-20}'
	EOF
chmod 400 ts3db_mariadb.ini

for file in teamspeak.tar.bz2 doc serverquerydocs CHANGELOG LICENSE ts3server_minimal_runscript.sh ts3server_startscript.sh redist; do rm -rf $file; done
for file in *.so *.so.2 ts3server sql sql/*/; do chmod 500 $file; done
