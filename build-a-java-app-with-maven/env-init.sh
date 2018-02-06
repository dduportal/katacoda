#!/bin/bash

echo "== Loading your sandbox environment. Pleas wait..."

cat <<EOF >docker-compose.yml
version: '3.2'

services:
  gitserver:
    image: cendrierdocker/git-server:v1
    ports:
    - "3000:3000"
  jenkins:
    image: cendrierdocker/jenkins-server:v1
    ports:
    - "8080:8080"
    user: root
    volumes:
    - /var/run/docker.sock:/var/run/docker.sock
EOF

docker-compose ps
