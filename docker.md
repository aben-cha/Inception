# What is Docker?
* Docker is an open platfrom for developing, shupping, and running applications.
* Docker enables you to separate your applications from your infrastructure so 
  you can deliver software quickly.
* Docker is a tool for running applications in an isolated environment.
* With docker we can easily package up our application with everything it needs
  and run it anywhere on any machine.

# What can I use Docker for?
    1- Application Containerization
    2- Development and Testing
    3- Streamlining Deployment
    4- Microservices Architecture
    5- Continuous Integration/Continuous Deployment (CI/CD)
    6- Cloud-Native Applications

# Docker architecture
    * Docker uses a client-server architecture
    * The Docker client talks to the Docker daemon
    * The Docker client and daemon can run on the same system, or you can connect a 
      Docker client to a remote Docker daemon
    * The Docker client and daemon communicate using a REST API
      calls over Http (over UNIX sockets or a network interface).
    1- Docker client
        * The interface that developers use to interact with docker 
        * Sends commands (docker build, run, pull ...) to the Docker
          Daemon using REST API class over HTTP
        * Example tools: Command Line Interface (CLI), Docker Desktop.
    2- Docker Daemon: (dockerd)
        * The core component of docker running on the host system
          responsible for managing Docker objects (containers, images, 
          volumes, ...).
        * Listens to requests from the Docker Client, executes them
          and communicates with the underliying operating system to manage
          containers
    3- Docker Desktop:
        * it provides a straightforward GUI (Graphical User Interface) that
          lets you manage your containers, applications and images directly 
          from your machine
        * Docker Desktop reduces the time spent on complex setups so you can 
          focus on writing code.
    4- Docker registries:
        * A docker registries stores Docker images 
        * Docker Hub ia s public registry that anyone can use and Docker looks 
          for images on Docker Hub by default, you can even run your own private registry
        * Whe you use the docker pull or docker run commands, docker pulls the required
          images from your configured registry
    5- Docker Images:
        * Read only templates that define what's inside a container, including
          the application, libraries, and dependencies
        * Ofen an image is based on another images, with some additional customization
        * Images are built using a Dockerfile(defining the steps needed to create the image)
        * Each instructions in a Dockerfile creates a layer in the image, When you change 
          the Dockerfile and rebuild the image only those layers which have changed are rebuilt
          this part of what makes images so lightweight small and fast when compared to other
          virtualization technologies.
    6- Docker Containers
        * Lightweight, portable and isolated instances of an images that run the application
        * Containers share the host OS kernel, making them more efficient that virtual machines.
    7- Docker Engine
        * The runtime that combines the Docker Daemon, CLI, and APIs to manage containers and images
        * Processes commands and integrates with the operating system to execute containerized workloads
    8- Underlying Operating System:
        * The host system where Docker runs
        * Provides the kernel features (like namsecpaces cgourps) that Docker uses to 
          isolate and manage containers.
# Diagram of Docker Architecture:
    Docker Client
        ↓
    Docker REST API
        ↓
    Docker Daemon
        ↙︎       ↘︎
    Images      Containers
        ↓           ↓
    Registry     Host OS Kernel

# Summary of Workflow:
    1- A user interacts with the Docker Client.
    2- The client sends commands to the Docker Daemon via the REST API.
    3- The daemon pulls or pushes images from/to the Docker Registry.
    4- The daemon creates and manages Docker Containers based on the images.
    5- The containers run isolated applications, leveraging the Host OS Kernel for resource management.