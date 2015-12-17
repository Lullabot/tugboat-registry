IMAGES = $(shell echo */ | sed 's/\///g')
.PHONY: all $(IMAGES)

all: $(IMAGES)

# Dependencies
apache: ubuntu
apache-drupal: apache-php
apache-php: apache
couchdb: ubuntu
memcached: ubuntu
mysql: ubuntu

$(IMAGES):
	cd $@ && docker build -t localhost:5000/$@ .
