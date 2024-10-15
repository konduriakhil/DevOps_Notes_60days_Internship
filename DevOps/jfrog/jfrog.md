Jfrog Artifact Repository
--------------------------
* Jfrog is private artifact repository to store binaries, build files, artifacts, docker images.
* Jfrog provides 3 types of services
    1. Local repositories
       1. This stores the artifacts which we have built
    2. Remote repositories
       1. This stores the third party libraries and artifacts of open source
    3. Virtual repositories
       1. This is the combination of local repo and remote repo as logical whole
* It provides free trail version for 14 days
* ![alt text](images/Jfrog1.png)
* ![alt text](images/Jfrog2.png)
* ![alt text](images/Jfrog3.png)
* Write the domain which you want for the instance
* ![alt text](images/Jfrog4.png)
* login to the jfrog
## Create the new project
* ![alt text](images/Jfrog5.png)
* Give the project name, password and necessary credentials required to create the project
* ![alt text](images/Jfrog6.png)
* See whether project is created or not.
* ![alt text](images/Jfrog7.png)
## Create the new repository
* Create the new repository through the following ways
* ![alt text](images/Jfrog8.png)
* ![alt text](images/Jfrog9.png)
* select the type of artifact which you are going to build, docker for docker images
* ![alt text](images/Jfrog10.png)
* ![alt text](images/Jfrog11.png)
## Push the images to Jfrog from our system
* ![alt text](images/Jfrog12.png)
* ![alt text](images/Jfrog13.png)
* ![alt text](images/Jfrog14.png)
* ![alt text](images/Jfrog15.png)
* Tocken is generated, copy it because of security purpose it is not shown again
* ![alt text](images/Jfrog16.png)
* ![alt text](images/Jfrog17.png)
* ![alt text](images/Jfrog18.png)
### Giving connection to Jfrog
```sh
docker login <account url>
docker login https://akhilinternship.io/
Username: ajayqualitythought2023@gamil.com
# Password: <enter password>
```
* ![alt text](images/Jfrog19.png)
```sh
docker image ls
docker image tag nginx:latest akhilinternship.io/library-docker/spc:1.0
docker push akhilinternship.io/library-docker/spc:1.0
```
* ![alt text](images/Jfrog20.png)
* ![alt text](images/Jfrog21.png)
* ![alt text](images/Jfrog22.png)
* ![alt text](images/Jfrog23.png)
* ![alt text](images/Jfrog24.png)
* ![alt text](images/Jfrog25.png)