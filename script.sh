#! /bin/bash

cd /home

composer install
docker-compose build
docker-compose up -d 
docker-compose ps 