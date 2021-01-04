#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=abraam31/udacity-sklearn:latest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
cat temp/password.txt | docker login --username abraam31 --password-stdin
docker tag udacity-sklearn $dockerpath
# Step 3:
# Push image to a docker repository
docker push $dockerpath
