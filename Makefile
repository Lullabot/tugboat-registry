IMAGES = $(shell echo */ | sed 's/\///g')
.PHONY: all $(IMAGES)

all: $(IMAGES)

couchdb: ubuntu

$(IMAGES):
	cd $@ && docker build -t localhost:5000/$@ .
