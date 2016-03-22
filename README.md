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

    docker run -d -p 5000:5000 -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry -v /var/lib/registry:/var/lib/registry --restart=always --name registry-2.1.1 registry:2.1.1

Then, push each of the newly generated Docker images to the local registry with

    make push
