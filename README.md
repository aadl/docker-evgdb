## Evergreen Database Docker Image

This repo is a packer build of a docker image that includes the dependencies that evergreen needs. It does not create the database or add data.

To run:

`docker run -d --name postgres -e POSTGRES_PASSWORD=evergreen -e POSTGRES_USER=evergreen -p 5432:5432 ghcr.io/aadl/evgdb:latest`
