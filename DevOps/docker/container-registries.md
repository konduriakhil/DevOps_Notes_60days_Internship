# Azure Container Registry
## Manual
* Login to Azure and follow the following images
* ![alt text](images/docker6.png)
* ![alt text](images/docker7.png)
* ![alt text](images/docker8.png)
* ![alt text](images/docker9.png)
* ![alt text](images/docker10.png)
* ![alt text](images/docker11.png)
```sh
docker login <Azure container registry url>
    USERNAME:
    PASSWORD: 
docker image tag nginx:latest <azure container registry url>/nginx:1
docker image ls
docker image push <azure container registry url>/nginx:1
```
* ![alt text](images/docker12.png)
* ![alt text](images/docker13.png)
* ![alt text](images/docker14.png)
## Azure Pipeline
* Create Azure Container Registry from console login 
* 
### Azure Container Registry
* Create Azure Container Registry
* ![alt text](images/docker19.png)
* ![alt text](images/docker20.png)
* ![alt text](images/docker21.png)
* Make service connecion in Azure DevOps project
* ![alt text](images/docker22.png)
* ![alt text](images/docker23.png)
* ![alt text](images/docker24.png)
* ![alt text](images/docker25.png)
* ![alt text](images/docker26.png)
* ![alt text](images/docker27.png)
* ![alt text](images/docker29.png)
* ![alt text](images/docker28.png)
# Docker Hub
* login to dockerhub
```sh
docker login -u <username>
    PASSWORD: Akhil@123
docker image ls
docker tag nginx:latest <username>/<repository_name>:1 
docker image ls
docker push <username>/<repository_name>:1
```
![alt text](images/docker15.png)
![alt text](images/docker16.png)
![alt text](images/docker17.png)
