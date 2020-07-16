# TeamSpeak3 Server as a Container

## Requirements
To use this project you'll need:  
Docker, Docker-compose, Git

Optionally, if you intend to connect the ts3 server via MariaDB you'll need a MariaDB server and socket available for the instance to use.

## Installation
1. Download this project. `git clone https://github.com/Carlgo11/Teamspeak-docker.git`
1. Edit the `ts3server_config.ini` and `mariadb_config.ini` to fit your needs.
1. (Optional) Remove any unused files sent to the container as volumes inside `docker-compose.yml`.
1. Build the container. `docker-compose up`
1. Connect to the TeamSpeak3 server using the host IP.

## LICENSE
This work is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). See the full license [here](LICENSE).
