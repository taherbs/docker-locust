# Docker-Locust
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/taherbs/Docker-Locust/master/LICENSE)

The purpose of this project is to provide a ready and easy-to-use version of [locust.io] service, additionally to features that are a nice to have.

## Architecture

Docker-Locust consist of 2 different roles:

- Master: Instance that will run Locust's web interface where you start and stop the load test and see live statistics.
- Slave: Instance that will load and attack the target url based parameters set in the [.env] file.

This architecture support following type of deployment:

- Single container mode (standalone mode): If user have only one single machine.
- Multiple containers mode: If user have more than one machine and want to create bigger load. This type of deployment might be used in docker-swarm or kubernetes cases. A multiple containers mode deployment example is defined in this project using [docker-compose].

## Requirements
1. [docker engine]
2. [docker-compose]

## Getting Started

### Set configuration

Update the .env file with needed params

```bash
vi .env
```

### Build container locally on your machine (Optional)

```bash
# Build service container
make build
```

### Single machine / Standalone mode

Standalone version is for users who has only 1 single machine.

```bash
# Run the service in standalone mode
make standalone-run
```

### Multiple machines

Multiple containers mode is useful to create bigger load (if you have more than one machine). In this example we are using docker-compose, but it is also possible to run it on different other platforms, e.g. using Cloudformation in AWS, Kubernetes or Swarm.

```bash
# Run the service in multi-containers
make distributed-run
```

[.env]: <.env>
[locust.io]: <http://locust.io>
[docker engine]: <https://docs.docker.com/engine/installation/>
[docker-compose]: <https://docs.docker.com/compose/install/>
[our example]: <https://raw.githubusercontent.com/taherbs/locust-docker/locust-tasks/basic-locustfile.py>
