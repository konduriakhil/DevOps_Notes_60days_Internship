Nodejs Applicaion
--------------------
* We can run the application through the following ways
  1. Manually
  2. Docker
## Requirements
   1. nvm
   2. nodejs
   3. npm 
      1. package.json(Dependencies and Configaration management)
# three_tier_application
## Manually
### Requirements
  1. node version manager(nvm)
  2. node10
     1. npm comes with node installation

```sh
sudo apt update
# Install node version manager(nvm)
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash 
source ~/.bashrc
nvm --version
# Installing nodejs 10
nvm install 10
node --version
# Installing necessary packages
npm install
# This is for running the application
npm run serve
  # This is for building the code and `dist` folder created and executables are there
  npm run build

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
FROM node:10-alpine AS build
LABEL authenticator="akhil"
WORKDIR /nod
COPY . /nod/
RUN npm install 
RUN npm run build

FROM nginx:alpine3.17-slim
# Label for the image
LABEL Auther="Akhil"
LABEL Purpose="Project"
# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf
# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/
# Copy the build files from the React build stage
COPY --from=Build /nod/dist /usr/share/nginx/html
# Expose port 80
EXPOSE 80
# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
```
##### nginx.conf
```sh
###### nginx.conf  ###########
server {
    listen 80;
    server_name localhost;
 
    root /usr/share/nginx/html;
    index index.html;
 
    location / {
        try_files $uri $uri/ /index.html;
    }
 
    location /static/ {
        expires 30d;
        add_header Cache-Control "public";
    }
 
    error_page 404 /index.html;
}
```
### Trivy
* Install trivy on your machine to scan the docker image and to find vulnerabilities
```sh
# Installing trivy
sudo apt-get install -y wget
wget https://github.com/aquasecurity/trivy/releases/download/v0.34.0/trivy_0.34.0_Linux-64bit.deb
sudo dpkg -i trivy_0.34.0_Linux-64bit.deb
# Scanning the docker image
trivy image spc:1
```
# Library Management system
## Manually
### Requirements
  1. node version manager(nvm)
  2. node18
     1. npm comes with node installation

```sh
sudo apt update
# Install node version manager(nvm)
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash 
source ~/.bashrc
nvm --version
# Installing nodejs 10
nvm install 18
node --version
npm --version
# Installing necessary packages
npm install
# This is for building the application
npm run build
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
FROM node:18-alpine3.19 AS build
LABEL Authour="akhil"
WORKDIR /library
RUN npm install && \
    npm run build;

FROM nginx:alpine3.17-slim
LABEL Auther="Akhil"
LABEL Purpose="Project"
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY --from=build /library/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```
##### nginx.conf
```sh
###### nginx.conf  ###########
server {
    listen 80;
    server_name localhost;
 
    root /usr/share/nginx/html;
    index index.html;
 
    location / {
        try_files $uri $uri/ /index.html;
    }
 
    location /static/ {
        expires 30d;
        add_header Cache-Control "public";
    }
 
    error_page 404 /index.html;
}
```
### Trivy
* Install trivy on your machine to scan the docker image and to find vulnerabilities
```sh
# Installing trivy
sudo apt-get install -y wget
wget https://github.com/aquasecurity/trivy/releases/download/v0.34.0/trivy_0.34.0_Linux-64bit.deb
sudo dpkg -i trivy_0.34.0_Linux-64bit.deb
# Scanning the docker image
trivy image spc:1
```