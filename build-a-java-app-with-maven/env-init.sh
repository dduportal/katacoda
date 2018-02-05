#!/bin/bash

# Run git server
docker run -d -p 3000:3000 --name git-server cendrierdocker/git-server:v1

# Run jenkins server
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-server --link git-server:git-server cendrierdocker/jenkins-server:v1
