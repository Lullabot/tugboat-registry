# tugboat-registry

This repository contains the Docker build files to create all of the images
hosted at registry.tugboat.qa. Images are based on phusion/baseimgage, except
the base image is built locally first instead of being pulled from dockerhub.
This is so we can get the latest security updates from the official Ubuntu
images when we regenerate our registry.

To generate all of the images

    make

To generate a specific image (along with any of its dependencies)

    make <imagename>

The following will start a local Docker repository. This is not necessary for
creating the images, but is useful for using them on the local network.

    docker run -d -p 5000:5000 -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry -v /var/lib/registry:/var/lib/registry --restart=always --name registry-2.3.1 registry:2.3.1

Then, push each of the newly generated Docker images to the local registry with

    make push

See https://github.com/docker/distribution/releases for the latest version of the registry server

## Testing Images
If you have created or modified an image, and have already created a local
Docker repository as described above, perform the following steps to test your
changes:

1. `make <imagename>`
1. `docker create localhost:5000/<imagename>:latest`
1. The previous command will output a hash for the created container; use it to start the container:

    `docker start <containerhash>  -i`
