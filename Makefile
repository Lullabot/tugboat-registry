THIS_FILE := $(lastword $(MAKEFILE_LIST))
IMAGES = $(shell echo */ | sed 's/\///g' | sed 's/ubuntu//' | sed 's/baseimage//')

.PHONY: all clean push baseimage ubuntu $(IMAGES)

all: baseimage ubuntu $(IMAGES)

# Dependencies
apache-php: apache
apache-php-drupal: apache-php
apache-php7: apache
apache-php7-drupal: apache-php7
mysql-56: mysql
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

test-all: test-baseimage test-mysql
test-baseimage: baseimage
	######
	# Test locales are configured properly.
	docker run localhost:5000/baseimage:latest locale -a | grep ^en_US$$
	docker run localhost:5000/baseimage:latest locale -a | grep ^en_US\.utf8$$
	@printf "Test passed.\n\n"

	######
	# Test that upstart is diverted to /bin/true.
	# See baseimage/prepare.sh.
	docker run localhost:5000/baseimage:latest /sbin/initctl
	@printf "Test passed.\n\n"

	######
	# Test that ischroot is diverted to /bin/true.
	# See baseimage/prepare.sh.
	docker run localhost:5000/baseimage:latest /usr/bin/ischroot
	@printf "Test passed.\n\n"

	######
	# Test that the cleanup script did what we expect.
	# See baseimage/cleanup.sh
	docker run localhost:5000/baseimage:latest sh -cex '\
		! test -e /bd_build; \
		! ls /tmp/* 2>/dev/null; \
		! ls /var/tmp/* 2>/dev/null; \
		! ls /var/lib/apt/lists/* 2>/dev/null; \
		! test -e /etc/dpkg/dpkg.cfg.d/02apt-speedup; \
		! ls /etc/ssh/ssh_host_* 2>/dev/null'
	@printf "Test passed.\n\n"

	######
	# Test the included Makefile.
	docker rm baseimage-test-container 2&>/dev/null || true
	docker create -v /tests --name baseimage-test-container localhost:5000/baseimage:latest /bin/true
	docker cp .circleci/test/* baseimage-test-container:/tests
	docker run --volumes-from baseimage-test-container localhost:5000/baseimage:latest make -C /tests test
	docker rm baseimage-test-container
	@printf "Test passed.\n\n"

	@echo "All baseimage tests passed!"

test-mysql: mysql
#	# Ensure large prefix is on and file format is Barracuda.
	@docker stop mysql-test-container 2&>/dev/null && \
	  docker rm mysql-test-container 2&>/dev/null || true
	@docker create --name mysql-test-container localhost:5000/mysql:latest
	docker start mysql-test-container
#	# Wait a bit for mysql to start running.
	@echo "Starting MySQL."
	@sleep 20
	@docker exec -it mysql-test-container \
	  mysql -u root --password="" \
	  -N -B -e  "SELECT @@GLOBAL.innodb_large_prefix;" | grep -q 1 && \
	  echo "innodb_large_prefix is on."
	@docker exec -it mysql-test-container \
	  mysql -u root --password="" \
	  -N -B -e "SELECT @@GLOBAL.innodb_file_format;" | grep -q Barracuda && \
	  echo "innodb_file_format is Barracuda."
	@docker stop mysql-test-container >/dev/null && \
	  docker rm mysql-test-container >/dev/null || true
	@echo "Test passed."
