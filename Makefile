## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

setup-local:
	virtualenv -p /usr/local/opt/python@3.7/bin/python3 ~/.devops

install:
	# for linux
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	if [ ! -d ./bin ]; then mkdir ./bin; fi
	wget -O ./bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
	chmod +x ./bin/hadolint

install-mac:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# for linux
	./bin/hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

lint-mac:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

validate-circleci:
	circleci config process .circleci/config.yml

run-circleci-local:
	circleci local execute

all: install lint test
