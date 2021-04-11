[![CircleCI](https://circleci.com/gh/ShivakumarSwamy/operationalize-a-ml-microservice-api.svg?style=shield)](https://circleci.com/gh/ShivakumarSwamy/operationalize-a-ml-microservice-api)

# Table of Contents

- [Project Overview](#project-overview)
- [Project Tasks](#project-tasks)
- [Run app in different environments](#run-flask-app-in-different-environments)
    - [Running locally](#running-locally)
    - [Running in docker](#running-in-docker)
    - [Running in kubernetes](#running-in-kubernetes)
- [Running circleci locally](#running-circleci-locally)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

## Run flask app in different environments 

### Running locally

1. Install python3.7 and virtualenv using [Homebrew](https://brew.sh/)
    ```bash
    brew update
    brew install python@3.7 virtualenv
    ```

1. Create a virtualenv with python3.7 
   (location of interpreter depends on homebrew install configuration, here the default location is used) and activate it
    ```bash
    make setup-local
    source ~/.devops/bin/activate
    ```

1. Install python dependencies using [requirements file](./requirements.txt)
    ```bash
    make install 
    ```

1. Install hadolint to lint Dockerfile
    ```bash
    brew install hadolint
    ```

1. Install pylint to lint python files
    ```bash
    pip install pylint==2.7.4
    ```

1. Run lint on Dockerfile and python files
    ```bash
   make lint 
   ```

1. Run flask app locally
    ```bash
   python app.py 
   ```
   
### Running in docker

1. Install [docker-desktop](https://www.docker.com/products/docker-desktop) to run containers

1. Execute the below bash script with defaults to build image and run as a container
   (note: host port 8000 is exposed)
    ```bash
   ./run_docker.sh
   ```

### Running in kubernetes

1. Install kubernetes cli
   ```bash
   brew install kubernetes-cli
   ```
   
1. Install [minikube](https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-minikube/)
   
1. Start minikube cluster
    ```bash
   minikube start 
   ```

1. Execute the below bash script with defaults to upload an image to dockerhub
    ```bash
   ./upload_docker.sh
   ```
   
1. Execute the below bash script with defaults to run app in kubernetes 
   (note: host port 8000 is exposed and re-run again after the first run, when the pod status is running - `kubectl get pods`)
    ```bash
   ./run_kubernetes.sh
   ```

# Make prediction

[Run the flask app](#run-flask-app-in-different-environments) and execute the below bash script to make predictions
```bash
./make_prediction.sh
```

# Running circleci locally

1. Install circleci
    ```bash
   brew install circleci 
   ```

1. Validate [circleci config file](./.circleci/config.yml)
    ```bash
   make validate-circleci 
   ```

1. Run circleci locally [circleci config file](./.circleci/config.yml)
   (note: make sure docker is running)
    ```bash
   make run-circleci-local 
   ```

Note: You can deactivate an active virtualenv by running the `deactivate` command