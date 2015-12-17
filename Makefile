IMAGES = $(shell echo */ | sed 's/\///g')
.PHONY: all $(IMAGES)

all: $(IMAGES)

# Dependencies
apache-drupal: apache-php
apache-php: apache
supervisor-nodejs: supervisor

$(IMAGES): ubuntu
	cd $@ && docker build -t localhost:5000/$@ .
