FROM ubuntu:14.04
MAINTAINER Phusion <info@phusion.nl>

ADD . /bd_build

RUN /bd_build/prepare.sh && \
	/bd_build/system_services.sh && \
	/bd_build/utilities.sh && \
	/bd_build/cleanup.sh && \
	mkdir -p /usr/share/tugboat

COPY share/* /usr/share/tugboat/

CMD ["/sbin/my_init"]
