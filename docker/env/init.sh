#!/bin/bash

echo "Envoronment - $1"

# Docker file
file="./docker/env/docker-compose.$1.yml"

if [ -f "$file" ]
then
    cp "$file" ./docker-compose.yml
    echo "Copy docker-compose file for $1 environment"
else
    echo "Docker-compose file for '$1' environment not found"
fi
