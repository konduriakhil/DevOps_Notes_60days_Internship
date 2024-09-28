Docker Concepts
-----------------
# Dockerfile
* Docker is text based file
* First Column is called `instructions`, in the second cloumn we give `argument`
    * Generic Syntax is INSTRUCTION arguments for eg FROM alpine or RUN echo 'Hello'
![alt text](images/docker2.png)
* VAR is build time variable
* ENV is runtime variable
![alt text](images/docker1.png)
## Running the application manually by the reference of Dockerfile
* In Dockerfile we see commands like this
![alt text](images/docker4.png)
  ### Alpine Package Keeper
  * APK is used to manage software packages within Alpine Linux. It allows you to install, update, and remove packages.
  In Dockerfiles, you often see commands like RUN apk add --no-cache <package> to install necessary software packages without caching the package index, which helps keep the image size small.
  * For ubuntu we have package manager called `apt-Advanced Package Tool`
  ### How image layers are operated
  **Docker images provide a foundation for running containers.** When a container is created from an image, the image's layers are used as a base to create a writable filesystem within the container. This filesystem is initially based on the image's layers, but any changes you make within the container (e.g., creating files, modifying existing files) are stored in a separate writable layer.

**Here's how Docker images help when a container is running:**

1. **Base Environment:** The image's layers provide the base environment for the container, including the operating system, pre-installed software, and configuration settings.
2. **Consistent Environment:** Using the same image for multiple containers ensures a consistent environment, making it easier to manage and troubleshoot applications.
3. **Efficiency:** The layered structure of images allows Docker to efficiently transfer and manage images. Only the changed layers need to be transferred when sharing or distributing images.
4. **Isolation:** Containers are isolated from each other, preventing conflicts and ensuring that each container has its own dedicated environment.
5. **Portability:** Docker images can be easily moved and deployed across different environments, making it easier to develop, test, and deploy applications.

**In summary, Docker images provide a foundation for running containers by defining the base environment, ensuring consistency, improving efficiency, providing isolation, and enabling portability.**
