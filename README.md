# TeamSpeak3 Server as a Container

[![License](https://img.shields.io/github/license/Carlgo11/Teamspeak-docker?color=00b1d6&style=for-the-badge)][license]
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Carlgo11/Teamspeak-docker?style=for-the-badge)][version]
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Carlgo11/Teamspeak-docker/Docker?style=for-the-badge)][workflow]
[![Docker](https://img.shields.io/docker/image-size/carlgo11/teamspeak?label=Docker&sort=semver&style=for-the-badge)][docker]    

This package is a minimal version of TeamSpeak3 as a Docker container.  
The aim of this project is to provide an always-up-to-date highly secure way to install and run a TeamSpeak3 server regardless of the OS that the host runs on.

## Requirements

To use this project you'll need:
* Docker-compose
* cURL/Wget

## Installation

### MariaDB (MySQL)

1. Download the files in [examples/mariadb][mariadb].
   ```sh
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/mariadb/docker-compose.yml
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/mariadb/ts3server_config.ini
   ```
1. Enter the database credentials in `docker-compose.yml`.
1. Start the docker containers (append `-d` to run in the background.)
   ```sh
   docker-compose up -d
   ```

### SQLite

1. Download the files in [examples/sqlite][sqlite].
   ```shell
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/sqlite/docker-compose.yml
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/sqlite/ts3server_config.ini
   ```
1. Start the docker containers (append `-d` to run in the background.)
   ```sh
   docker-compose up -d
   ```

### Port configuration

A list of all incoming and outgoing ports that TS3 uses can be found [here][ports].  
If you need an optional feature, such as TSDNS or ServerQuery, add the appropriate port to the `ports` array in `docker-compose.yml`

## LICENSE

This work is licensed under [CC BY 4.0][cc]. See the full license [here][license].

[license]: LICENSE
[cc]: https://creativecommons.org/licenses/by/4.0/
[version]: https://github.com/Carlgo11/Teamspeak-docker/releases/latest
[workflow]: https://github.com/Carlgo11/Teamspeak-docker/actions?query=workflow%3ADocker
[docker]: https://hub.docker.com/r/carlgo11/teamspeak
[mariadb]: https://github.com/Carlgo11/Teamspeak-docker/tree/master/examples/mariadb
[sqlite]: https://github.com/Carlgo11/Teamspeak-docker/tree/master/examples/sqlite
[ports]: https://support.teamspeak.com/hc/en-us/articles/360002712257