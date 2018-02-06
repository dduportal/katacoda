#!/bin/bash

set +x # Disable debug

COMPOSE_VERSION=1.18.0
COMPOSE_PATH="$(which docker-compose)"

echo "== Loading your environment. Please wait..."

curl -sSL -o "${COMPOSE_PATH}" "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
chmod a+x "${COMPOSE_PATH}"

touch /docker-compose.yml
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

docker-compose up -d

echo "== Environment fully loaded"
