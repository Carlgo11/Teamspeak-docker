# TeamSpeak3 Server as a Container

![License](https://img.shields.io/github/license/Carlgo11/Teamspeak-docker?color=00b1d6&style=for-the-badge)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Carlgo11/Teamspeak-docker?sort=semver&style=for-the-badge)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Carlgo11/Teamspeak-docker/Docker?style=for-the-badge)

## Requirements

To use this project you'll need:  
Docker, Docker-compose, Git

Optionally, if you intend to connect the ts3 server via MariaDB you'll need a MariaDB server and socket available for the instance to use.

## Installation

### SQLite

1. Download this project. `git clone https://github.com/Carlgo11/Teamspeak-docker.git; cd Teamspeak-docker/`
1. Change the name of `ts3server_config.ini.sqlite-example` to `ts3server_config.ini`
1. Build the container. `docker-compose up --build`
1. Connect to the TeamSpeak3 server using the host IP.

### MariaDB (MySQL)

1. Download this project. `git clone https://github.com/Carlgo11/Teamspeak-docker.git`
1. Change the name of `ts3server_config.ini.mariadb-example` to `ts3server_config.ini`
1. Add the MariaDB credentials to `mariadb_config.ini`
1. Open `docker-compose.yml` and append the following lines at the end of the volume tag:

```yaml
    - ./ts3db_mariadb.ini:/teamspeak/ts3db_mariadb.ini
    - /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock
````

5. Build the container. `docker-compose up --build`
6. Connect to the TeamSpeak3 server using the host IP.

## LICENSE

This work is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). See the full license [here](LICENSE).
