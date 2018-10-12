# Locust-Docker

[![MIT licensed]([License])


The purpose of this project is to provide a ready and easy-to-use version of [locust.io] which also contains additional/useful features that are required.

## Architecture

Locust-Docker consist of 2 different roles:

- Master: Instance that will run Locust's web interface where you start and stop the load test and see live statistics.
- Slave: Instance that will simulate users and attack the target url based on user parameters.

This architecture support following type of deployment:

- Single container (standalone mode): If user have only one single machine.
- Multiple containers: If user have more than one machine and want to create bigger load. This type of deployment might be used in docker-swarm or kubernetes case. A multiple containers mode deployment example is defined in the [docker-compose].

## Requirements
1. [docker engine]
2. [docker-compose]

## Getting Started

### Set entry parameters

Update the .env file with needed params

```bash
vi .env
```

### Build container locally on your machine

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

Multiple containers mode is useful to create bigger load (if you have more than one machine). In this point we are using docker-compose, but it is also possible to run it in different ways, e.g. Cloudformation in AWS, Kubernetes, Swarm.

Run the application with the command:

```bash
# Run the service in multi-containers
make distributed-run
```

[License]: <LICENSE.md>
[locust.io]: <http://locust.io>
[docker engine]: <https://docs.docker.com/engine/installation/>
[docker-compose]: <https://docs.docker.com/compose/install/>
[our example]: <https://raw.githubusercontent.com/taherbs/locust-docker/locust-tasks/basic-locustfile.py>
