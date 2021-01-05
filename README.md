
[![abraam31](https://circleci.com/gh/abraam31/udacity-devops-project4.svg?style=svg)](https://app.circleci.com/pipelines/github/abraam31/udacity-devops-project4)



## Project Overview

In this project, a flask python application, a ML model used to predict housing prices in Boston according to several features, is deployed on containarized platform (once on docker, another on Kubernetes).

## Building the Dockerfile which consists of 
  - Copying the application files on the containers
  - Installing any needed dependencies to run the application
  - Expose the needed ports for the app
  - Any needed commands at the start of the container
  - All of that is based on a specific image to start from.
  
Once the docker image is built from the Dockerfile, it is pushed to a private registry, which will be then used to pull and use the image from.

Then the application is deployed once with Docker, and another in Kubernetes using the kubectl cli. 

Also, circleci is used as a Continuous integration tool to validate the source code using hadolint for the Dockerfile and pylint. 


### Commands to deploy the app

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

Instead you can install Docker environment or kubernetes cluster and run the appropriate shell scripts to deploy the app.

### Linting the source code
* Install hadolint on your server 
* Run `make lint` to lint your Dockerfile and python application file app.py. (needs to be run after the make install)


### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
4. Test the app and Make a prediction: `./make_prediction.sh`

---


### Kubernetes Steps

** Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl


#files contained in the project

Makefile: contains all needed process/commands create virtual environment to run the app, install dependencies, do the lints and test on the source code using make syntax
Dockerfile: contains all needed process to containarize the application on a container (simple to run docker build -t <tag_name> #path_to_Dockerfile
app.py: main python code for oup sklearn application
requirements.txt: all needed python dependecies to be install via pip
run_docker.sh: Shell scripts to build your docker image, and run a container with exposed port on the docker host.
upload_docker.sh: Shell script to upload built docker image on a  docker registry
run_kubernetes.sh: Shell script to deploy the app on a kubernetes pod, then wait for the pod to be ready and forward the port on the kubernetes node
make_prediction.sh: Shell script to automate the prediction making.
