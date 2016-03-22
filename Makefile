IMAGES = $(shell echo */ | sed 's/\///g' | sed 's/ubuntu//' | sed 's/baseimage//')

.PHONY: all clean push baseimage ubuntu $(IMAGES)

all: baseimage ubuntu $(IMAGES)

# Dependencies
apache-drupal: apache-php
apache-php: apache

baseimage:
	docker pull ubuntu:14.04
	docker build -t localhost:5000/baseimage baseimage

ubuntu: baseimage
	docker build -t localhost:5000/ubuntu ubuntu

$(IMAGES): ubuntu
	docker build -t localhost:5000/$@ $@

push:
	rm -rf /var/lib/registry/docker
	for x in `docker images | grep localhost:5000 | awk '{print $$1}'`; do docker push $$x; done

clean:
	for x in `docker images | grep localhost:5000 | awk '{print $$1}'`; do docker rmi -f $$x; done
