# Nop Commerce
* The way of running the application are of two types
  1. Manually
  2. Docker
## Requirements
  1. dotnet-sdk-8
  2. Nop.Web.csproj(requirements and configaration file)
  3. t2.medium instance
  4. docker
  5. pom.xml
## Docker Installation
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
# Manually
## Requirements
  1. Docker
  2. dotnet-sdk-8
  3. Nop.Web.csproj(requirements and configaration file)
  4. t2.medium instance
* First install dotnet sdk in your local system
* ![alt text](images/nop1.png)
* ![alt text](images/nop2.png)
* ![alt text](images/nop3.png)
* Create a virtal machine `t2.medium` and install .net/sdk8
* Clone the git repository
```sh
# Install dotnet-sdk-8.0 in your machine and create published folder
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
mkdir published
# Clone repository, move to the folder and build the application with the help of `Nop.Web.csproj` file
git clone https://github.com/Gopi0527/nopproject.git
cd nopproject
dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o /home/ubuntu/published
# Go to homedirectory, go to published folder and make bin and logs folders
cd ~
cd published
mkdir bin logs
# Command to run the application
dotnet Nop.Web.dll --urls http://0.0.0.0:5000
```
* ![alt text](images/nop4.png)
* ![alt text](images/nop5.png)
* ![alt text](images/nop6.png)
* ![alt text](images/nop7.png)
* ![alt text](images/nop8.png)
* ![alt text](images/nop9.png)
* Now access the application through 5000 port like this
* ![alt text](images/nop10.png)
# Dockerfile
## Requirements
  1. docker
  2. dotnet/sdk base image
### Dockerfile
```Dockerfile
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
LABEL evaluator="akhil"
WORKDIR /nop
COPY . /nop/
RUN mkdir /published && \
    dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o /published && \
    cd /published && \
    mkdir bin logs;

FROM mcr.microsoft.com/dotnet/sdk:8.0
LABEL authour="akhil"
ARG HOMEDIR="/com"
# ARG USERNAME="com"
# USER ${USERNAME}
WORKDIR ${HOMEDIR}
# RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
# COPY --from=build --chown=${USERNAME}:${USERNAME} /published/ ${HOMEDIR}/
COPY --from=build /published/ ${HOMEDIR}/
EXPOSE 5000
CMD ["dotnet", "Nop.Web.dll", "--urls", "http://0.0.0.0:5000"]
```
![alt text](images/nop11.png)
![alt text](images/nop12.png)
![alt text](images/nop13.png)
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