#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=shivakumarswamy/udacity-ml-app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag udacity-ml-app:1.0 shivakumarswamy/udacity-ml-app:1.0
docker tag udacity-ml-app:latest shivakumarswamy/udacity-ml-app:latest

# Step 3:
# Push image to a docker repository
docker push shivakumarswamy/udacity-ml-app:1.0
docker push shivakumarswamy/udacity-ml-app:latest
