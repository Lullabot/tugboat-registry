THIS_FILE := $(lastword $(MAKEFILE_LIST))
IMAGES = $(shell echo */ | sed 's/\///g' | sed 's/ubuntu//' | sed 's/baseimage//')

.PHONY: all clean push baseimage ubuntu $(IMAGES)

all: baseimage ubuntu $(IMAGES)

# Dependencies
apache-php: apache
apache-php-drupal: apache-php
apache-php7: apache
apache-php7-drupal: apache-php7
nginx-php: nginx
nginx-php7: nginx
elasticsearch-2.4: elasticsearch-baseimage
elasticsearch-6: elasticsearch-baseimage

baseimage:
	docker pull ubuntu:14.04
	docker images | grep localhost:5000/baseimage\  || docker build -t localhost:5000/baseimage baseimage

ubuntu:
	docker images | grep localhost:5000/ubuntu\  || ( $(MAKE) -f $(THIS_FILE) baseimage && docker build -t localhost:5000/ubuntu ubuntu )

$(IMAGES): ubuntu
	docker images | grep localhost:5000/$@\  || docker build -t localhost:5000/$@ $@

push:
	for x in `docker images | grep localhost:5000 | grep -v baseimage | awk '{print $$1}' | sort`; do docker push $$x; done

clean:
	for x in `docker images | grep localhost:5000 | awk '{print $$1}'`; do docker rmi -f $$x; done

tugboat-init:
	ln -sf /var/lib/tugboat/apache /var/www/html
	rm -rf /var/www/__tugboat

tugboat-build:
	a2enmod include
