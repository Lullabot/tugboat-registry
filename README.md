# tugboat-registry

This repository contains the Docker build files to create all of the images
hosted at registry.tugboat.qa

To get a local Docker registry, run the following

    docker run -d -p 5000:5000 -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry -v /var/lib/registry:/var/lib/registry --restart=always --name registry-2.1.1 registry:2.1.1
