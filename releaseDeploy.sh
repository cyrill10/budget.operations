#!/bin/sh
docker-compose stop
docker-compose pull
docker-compose up -d
