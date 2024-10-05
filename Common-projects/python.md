# Python Applications
* We can run the application through the following ways
  1. Manually
  2. Docker
## Requirements
  1. python
  2. python3-venv(To create virtual environment)
  3. python3-pip(To download dependencies)
     1. requirements.txt(Dependencies and configaration file)
# Library Management System
## Manually
* Build the application through the following commands
```sh 
# Clone git repository
git clone https://LearningThoughtsEdu@dev.azure.com/LearningThoughtsEdu/Batch-1/_git/three-tier-example
# Get into api folder
cd three-tier-example/api/
# Checking python version
sudo python3 --version
# Installation of Pip
sudo apt install python3-pip -y
# Installing venv in machine
sudo apt install python3.12-venv
# Creating virtual environment
python3 -m venv .venv
# Activate the environment
source .venv/bin/activate
     # Adding postgres dev
     sudo apt update
     sudo apt install postgresql-dev musl-dev gcc -y
# Installing necessary libraries
sudo apt-get update
sudo apt-get install libpq-dev -y
# Installing the requirements
pip3 install -r requirements.txt
# Execute the following command to run the api server
gunicorn app:app -b 0.0.0.0:8080 --log-file - --access-logfile - --workers 4 --keep-alive 0
or 
python app.py
```
## Docker
### Docker Installation
```sh
# Docker Installation
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
docker info
# Adding user to docker group
sudo usermod -aG docker ubuntu
exit
docker info
# Deleting the all containers
docker rm -f $(docker container ls -a -q)
# Deleting the all images
docker rmi $(docker image ls -q)
# Creating docker image
docker image build -t sp:1 .
# Creating containers
docker container run -d -P --name akhil sp:1
```
#### Dockerfile
```Dockerfile
FROM 
```
# Three Tier Application
## Manual
* Manually run the application using the following commands
```sh
# Clone git repository
git clone https://LearningThoughtsEdu@dev.azure.com/LearningThoughtsEdu/Batch-1/_git/three-tier-example
# Get into api folder
cd three-tier-example/api/
# Checking python version
sudo python3 --version
# Installation of Pip
sudo apt install python3-pip -y
# Installing venv in machine
sudo apt install python3.12-venv
# Creating virtual environment
python3 -m venv .venv
# Activate the environment
source .venv/bin/activate
# Adding postgres dev
sudo apt update
sudo apt install postgresql-dev musl-dev gcc -y
# Installing necessary libraries
sudo apt-get update
sudo apt-get install libpq-dev -y
# Installing the requirements
pip3 install -r requirements.txt
# Execute the following command to run the api server
gunicorn app:app -b 0.0.0.0:8080 --log-file - --access-logfile - --workers 4 --keep-alive 0
or 
python app.py
```
### Docker Installation
#### Dockerfile
```Dockerfile
# Using official python runtime base image
FROM python:3.10.5-alpine3.16

# Set the application directory
WORKDIR /app

RUN apk add --no-cache entr postgresql-dev musl-dev gcc

# Install our requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy our code from the current folder to /app inside the container
COPY . /app

# Make port 80 available for links and/or publish
EXPOSE 80

# Define our command to be run when launching the container
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
```