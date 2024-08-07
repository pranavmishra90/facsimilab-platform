#!/bin/bash

# Set the image version number
facsimilab_version_num="v0.2.1"

# Base image
CONTAINER_NAME="pranavmishra90/facsimilab-base:$facsimilab_version_num"
echo $CONTAINER_NAME

docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-base:latest
docker tag $CONTAINER_NAME ghcr.io/pranavmishra90/facsimilab-base:latest

docker push docker.io/pranavmishra90/facsimilab-base:latest
docker push ghcr.io/pranavmishra90/facsimilab-base:latest
docker push ghcr.io/pranavmishra90/facsimilab-base:$facsimilab_version_num




# Main image
CONTAINER_NAME="pranavmishra90/facsimilab-main:$facsimilab_version_num"
echo $CONTAINER_NAME

docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-main:latest
docker tag $CONTAINER_NAME ghcr.io/pranavmishra90/facsimilab-main:latest

docker push docker.io/pranavmishra90/facsimilab-main:latest
docker push ghcr.io/pranavmishra90/facsimilab-main:latest
docker push ghcr.io/pranavmishra90/facsimilab-main:$facsimilab_version_num




# Full image
CONTAINER_NAME="pranavmishra90/facsimilab-full:$facsimilab_version_num"
echo $CONTAINER_NAME

docker tag $CONTAINER_NAME docker.io/pranavmishra90/facsimilab-full:latest
docker tag $CONTAINER_NAME ghcr.io/pranavmishra90/facsimilab-full:latest

docker push docker.io/pranavmishra90/facsimilab-full:latest
docker push ghcr.io/pranavmishra90/facsimilab-full:latest
docker push ghcr.io/pranavmishra90/facsimilab-full:$facsimilab_version_num

# Play an alert tone in the terminal to mark completion
echo -e '\a'