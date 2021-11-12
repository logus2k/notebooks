# ########
# GLOSSARY
# ########

# Container
A container is a collection of software processes unified by one namespace, with access to an operating system kernel that it shares with other containers and little to no access between containers.

In Docker, a container is a runtime instance of a Docker image, containing 3 things:

   1) A Docker image
   2) An execution environment
   3) A standard set of instructions

# Docker Engine
The Docker Engine is comprised of the runtime and the packaging tool. It must be installed on the hosts that run Docker.

# Docker Store
The Docker Store is an online cloud service where users can store and share their Docker images. It is also known as Docker Hub.



# ########
# COMMANDS
# ########

# Assign a variable named $FORMAT that can be use for a prettier output of some docker commands
export FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"

# List all containers
docker ps
docker container ls

# List all containers using $FORMAT
docker ps --format $FORMAT

# List all existing images
docker images

# List all containers (all states)
docker ps -a

# List last running containers (all states)
docker ps -l

# Instantiate and run a container interactively in a bash terminal based on an existing image named ubuntu
docker run -ti ubuntu bash

# Create an image named my-image (image_name:tag_name, where tag_name default is "latest") from joy_haibt container
docker commit joy_haibt my-image

# Start a container, run it for 5 seconds, and then exit and remove the container
docker run --rm -ti ubuntu sleep 5

# Start a container, run a bash terminal, wait 3 seconds, print all done, and then exit 
docker run -ti ubuntu bash -c "sleep 3; echo all done"

# Start a container and then exit, leaving it running (detached)
docker run -d -ti ubuntu bash

# Jump in (attach) to a running container named stoic_taussig
# NOTE: Ctrl+p followed by Ctrl+q exits a container leaving it running (detached)
docker attach stoic_taussig

# Create a container named example based on a ubuntu image and run an invalid command ("lose")
docker run --name example -d ubuntu bash -c "lose /etc/password"

# View the logs of a container named example
docker logs example

# Force to stop a container named example.
# NOTE: The kill operation does not remove a container, only stops it (v. docker rm).
docker kill example

# Remove a (stopped) container named example
docker rm example

# Configure the memory limit of a container created from image my_image
docker run --memory 2048 my_image

# Configure the CPU share of a container created from image my_image
docker run --cpu-shares my_image

# Configure the CPU quota limit of a container (relative to other containers) created from image my_image
docker run --cpu-quota my_image

# Run a ubuntu container named echo-server opening ports 45678 and 45679 (outside-port:inside-port)
docker run --rm -ti -p 45678:45678 -p 45679:45679 --name echo-server ubuntu bash

# Install netcat on the open ubuntu container
apt-get update
apt-get install -y netcat

# Use nc to accept data via TCP on port 45678 and then send it out through port 45679
nc -lp 45678 | nc -lp 45679

# Use nc to connect via TCP to the running container from another terminal
nc localhost 64452

# Use nc to accept data on port 45678 via UDP
nc -ulp 56349

# Use nc to connect via UDP to the running container from another terminal
nc -u localhost 56349

# From another terminal and while the container is running, commit it to create a new image named ubuntu-with-nc
docker commit echo-server ubuntu-with-nc

# Run a container only configuring internal ports 45678 and 45679, so that external ports are chosen dynamically
docker run --rm -ti -p 45678 -p 45679 --name echo-server ubuntu-with-nc bash

# Query what are the open ports in a running container
docker port echo-server

# Open UDP ports (outside-port:inside-port/protocol)
docker run -p 1234:1234/udp

# List the available docker networks
docker network ls

# Create a network named learning
docker network create learning

# Run a container named catserver with a network named learning
docker run --rm -ti --net learning --name catserver ubuntu-with-nc bash

# Run another container named dogserver with a network named learning
docker run --rm -ti --net learning --name catserver ubuntu-with-nc bash

# Install ping in a container
apt-get install inetutils-ping

# Check that both containers are reachable through the same network
ping catserver
ping dogserver

# Create a variable named SECRET in catserver environment
docker run --rm -ti -e SECRET=theinternetlovescats --name catserver ubuntu-with-nc bash

# Configure a unidirectional link between dogserver and catserver
docker run --rm -ti --link catserver --name dogserver ubuntu-with-nc bash

# Example of an image full name
registry.example.com:port/organization/image-name:version-tag

# Explicitly download an image from a repository
# NOTE: docker run executes the pull operation automatically
docker pull organization_name/image_name

# Upload an image to a repository
docker push organization_name/image_name

# Removes one or more images from the system
docker rmi image_name

# Create a persistent (shared with the host) volume (local_path:container_path)
docker run -ti -v /mnt/c/Labs/Git/master_cloud_native_infrastructure_with_kubernetes/volumes:/shared-folder ubuntu-with-nc bash

# Share a volume, without sharing it with the host, between the container sick_hopper and the current container being created
docker run -ti --volumes-from sick_hopper ubuntu_with_nc bash

# Login to DockerHum repository
docker login

# Pull an image from DockerHub repository
docker pull wurstmeister/kafka

# Create a new image tag
docker tag ubuntu-with-nc ubuntu-nc

# Execute a .Dockerfile to create a new image and deploy it in the local docker registry
# NOTE: The . refers to the directory where the .Dockerfile can be found
docker build -t image_name .

# Provide a container direct access to the host network, by turning off the protection that controls the network access
docker run -ti --rm --net=host ubuntu bash

# Provide a container control of the host and direct access to the host network
docker run -ti --rm --net=host --privileged=true ubuntu bash

# Provide a container visibility of the host's process ID namespace
# NOTE: For example, this allows the container to kill a host process. That process may be another running container.
#       Another example is to allow debugging host processes by using containerized debugging tools.
docker run -ti --rm --privileged=true --pid=host ubuntu bash

# Create a new network
docker network create my-new-network

# Query routing rules (Linux)
sudo iptables -n -L -t nat

# Use a jQuery-like syntax to query the Process ID of a running container named hello
docker inspect --format "{{.State.Pid}}" hello

# Mount a file system in a container
docker run -ti --rm --privileged=true ubuntu bash
mount -o bind other-work-dir work-dir

# Run a docker registry in a docker container
# NOTE: The parameter --restart=always configures the container to always restart immediately if it dies
#       Will use version 2 of docker registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2

# Backup a copy of the images busybox, ubuntu-with-nc and example/nanoer to a local compressed file
docker save -o my-images.tar.gz busybox ubuntu-with-nc example/nanoer

# Restore all the images contained in my_images.tar.gz
docker load -i my_images.tar.gz
