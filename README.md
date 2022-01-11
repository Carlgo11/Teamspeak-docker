# TeamSpeak3 Server as a Container

[![License](https://img.shields.io/github/license/Carlgo11/Teamspeak-docker?color=00b1d6&style=for-the-badge)][license]
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Carlgo11/Teamspeak-docker?style=for-the-badge)][version]
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/carlgo11/teamspeak-docker/Publish%20Image?style=for-the-badge)][workflow]
[![Docker](https://img.shields.io/docker/image-size/carlgo11/teamspeak?label=Docker&sort=semver&style=for-the-badge)][docker]    

This package is a minimal version of TeamSpeak3 as a Docker container.  
The aim of this project is to provide an always-up-to-date highly secure way to install and run a TeamSpeak3 server regardless of the OS that the host runs on.

## Requirements

To use this project you'll need:
* Docker-compose
* cURL/Wget

## Installation

1. Download the files in [examples][examples]
   ```sh
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/docker-compose.yml
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/ts3server_config.ini
   wget https://raw.githubusercontent.com/Carlgo11/Teamspeak-docker/master/examples/.env
   ```
1. Change the database credentials in `.env`
1. Start the docker containers
   ```sh
   docker-compose up -d
   ```

### Port configuration

A list of all incoming and outgoing ports that TS3 uses can be found [here][ports].  
If you need an optional feature, such as TSDNS or ServerQuery, add the appropriate port to the `ports` array in `docker-compose.yml`

## LICENSE

This work is licensed under GPL-3.0. See the full license [here][license].

[license]: LICENSE
[version]: https://github.com/Carlgo11/Teamspeak-docker/releases/latest
[workflow]: https://github.com/Carlgo11/Teamspeak-docker/actions/workflows/docker-publish.yml
[docker]: https://hub.docker.com/r/carlgo11/teamspeak
[examples]: https://github.com/Carlgo11/Teamspeak-docker/tree/master/examples
[ports]: https://support.teamspeak.com/hc/en-us/articles/360002712257
