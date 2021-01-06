#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=abraam31/udacity-sklearn:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run sklearn-dep --image=$dockerpath

# Step 3:
# List kubernetes pods
echo " "
kubectl get pods
echo " "
status=`kubectl get pods sklearn-dep -o jsonpath="{.status.phase}"`
while [ $status != "Running" ]; do
	echo "waiting for pod to be up.. sleeping for 10s!!"
	echo " "
	sleep 10s
	status=`kubectl get pods sklearn-dep -o jsonpath="{.status.phase}"`
	kubectl get pods
	echo "#####################"
	echo " "
done

# Step 4:
# Forward the container port to a host
echo "Forwarding the port container.."
kubectl port-forward sklearn-dep 8000:80
kubectl logs sklearn-dep

