# What is Docker?
* Docker is an open platfrom for developing, shupping, and running applications.
* Docker enables you to separate your applications from your infrastructure so 
  you can deliver software quickly.
* Docker is a tool for running applications in an isolated environment.
* With docker we can easily package up our application with everything it needs
  and run it anywhere on any machine.
* Docker is written in the Go programming language
* Docker uses a technology called namespaces to provide the isolated workspace 
  called the container. When you run a container, Docker creates a set of namespaces 
  for that container. These namespaces provide a layer of isolation. Each aspect of a 
  container runs in a separate namespace and its access is limited to that namespace.

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
    * The Docker client and daemon can run on the same system, or you can 
      connect a Docker client to a remote Docker daemon
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
        * Docker Engine is the complete package for running Docker
        * Components of Docker Engine:
            - Docker Daemon (dockerd)
            - Docker Client
            - REST API 
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
* A user interacts with the Docker Client.
* The client sends commands to the Docker Daemon via the REST API.
* The daemon pulls or pushes images from/to the Docker Registry.
* The daemon creates and manages Docker Containers based on the images.
* The containers run isolated applications, leveraging the Host OS Kernel for resource management.

# difference between containers and virtual machines (VMs):
* Virtual machine:
    * include a full operating system with its own kernel
    * each VM has its own dedicated resources
    * VMs take longer to start because the guest OS needs to boot 
    * Ideal for running multiple different operating systems or
      applications requiring strong isolation
    * VMs are typically gigabytes in size since they include the entire OS
* Containers:
    * share the host OS kernel and only package the necessary application
      code and dependencies, they are more lightweight since they don't 
      need a full OS
    * start almost instantly (seconds) and use fewer resources
    * Containers are usually megabytes since they only contain application code and dependencies
* Uses Cases:
                
                VMs
    - Running applications that need different OS types(Windows, Linux, ..)
    - Complete isolation requirements.
    - Legacy systems (Legacy applications that need specific OS environments)              

            Containers
    - Microservices architecture.
    - DevOps and CI/CD pipelines.
    - Applications that need rapid scaling.
    - Cloud-native applications.

# PID 1:
* PID 1 is the first process that is started by the kernel during the boot 
  process it plays a crucial role in system initilization and process management 
* PID 1 in Docker Containers:
  - In Docker the process defined in the conatiner's ENRTYPOINT or CMD 
    becomes the conatiner's PID 1
* Why is PID 1 Special?
  - Lifecycle Role: 
    as the first process it persists for the entire uptime of the system if PID 1
    crashes, the system will typically panic or become unstable .
  - System Signals:
    PID 1 is treated specially by the kernel and receives signals like SIGINT, 
    SIGTERM and SIGKILL directly during system shutdown.
* PID 1 is the cornerstone of process management in Linux. It starts the user space, 
  initializes services, and ensures process cleanup. In containers, PID 1 behaves 
  similarly but often requires special attention to handle signals and manage processes 
  effectively.
* The container’s PID 1 is independent of the VM’s PID 1.