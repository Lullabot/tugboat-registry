IMAGES = $(shell echo */ | sed 's/\///g')
.PHONY: all $(IMAGES)

all: $(IMAGES)

$(IMAGES):
	cd $@ && docker build -t localhost:5000/$@ .
