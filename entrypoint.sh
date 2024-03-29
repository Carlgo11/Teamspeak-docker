#!/usr/bin/env sh
umask 0077

cd /teamspeak || { echo "tmpfs '/teamspeak' not set" >&2; exit 1; }

# Download latest ts3 server
url=$(curl -s https://teamspeak.com/versions/server.json | jq -r '.linux.x86_64.mirrors."teamspeak.com"')
curl -sf "$(echo "$url"| sed -r 's/amd64/alpine/g')" -o teamspeak.tar.bz2 || { echo "Unable to download server" >&2; exit 1; }

# Extract ts3server files
tar -xjf teamspeak.tar.bz2 --strip-components=1

# Set up directories
[ -d "redist" ] && mv redist/* .
[ -d "files" ] || mkdir files
mkdir logs

# Set up files
touch allowlist.txt denylist.txt
cat <<- EOF >ts3db_mariadb.ini
		[config]
		host='${MARIADB_HOST:db}'
		port='${MARIADB_PORT:-3306}'
		username='${MARIADB_USER:teamspeak}'
		password='${MARIADB_PASSWORD}'
		database='${MARIADB_DATABASE:teamspeak}'
		socket='${MARIADB_SOCKET}'
		wait_until_ready=20
EOF

# Remove junk
for file in teamspeak.tar.bz2 doc serverquerydocs CHANGELOG LICENSE ts3server_minimal_runscript.sh ts3server_startscript.sh redist tsdns *_sqlite3.so *_postgresql.so sql/*_sqlite* sql/*_postgresql*; do rm -rf "$file"; done

# Set up permissions
for file in *.so *.so.2 ts3server sql sql/*/ .; do chmod 500 "$file"; done
chmod 400 ts3db_mariadb.ini
chmod 700 -R files

# Run the ts3 service
./ts3server "$@"