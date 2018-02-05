#!/bin/bash

# Run git server
docker run -d -p 3000:3000 --name git-server cendrierdocker/git-server:v1

# Run jenkins server
docker run -d -u root -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins-server --link git-server:git-server cendrierdocker/jenkins-server:v1
