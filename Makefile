IMAGES = $(shell echo */ | sed 's/\///g')
.PHONY: all $(IMAGES)

all: $(IMAGES)

couchdb: ubuntu
memcached: ubuntu

$(IMAGES):
	cd $@ && docker build -t localhost:5000/$@ .
