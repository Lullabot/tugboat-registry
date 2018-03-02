###
# Install OpenJDK JRE 8
# https://raw.githubusercontent.com/docker-library/openjdk/master/8-jre/Dockerfile
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM localhost:5000/ubuntu

# A few reasons for installing distribution-provided OpenJDK:
#
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#     really hairy.
#
#     For some sample build times, see Debian's buildd logs:
#       https://buildd.debian.org/status/logs.php?pkg=openjdk-8

RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
		wget \
	&& rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home

# do some fancy footwork to create a JAVA_HOME that's cross-architecture-safe
RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home
ENV JAVA_HOME /docker-java-home/jre

ENV JAVA_VERSION 8u151

# see https://bugs.debian.org/775775
# and https://github.com/docker-library/java/issues/19#issuecomment-70546872
#ENV CA_CERTIFICATES_JAVA_VERSION 20170531+nmu1

RUN set -ex; \
	\
# deal with slim variants not having man page directories (which causes "update-alternatives" to fail)
	if [ ! -d /usr/share/man/man1 ]; then \
		mkdir -p /usr/share/man/man1; \
	fi; \
	\
	add-apt-repository -y ppa:openjdk-r/ppa; \
	apt-get update; \
	apt-get install -y \
		openjdk-8-jre \
		ca-certificates-java \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
# verify that "docker-java-home" returns what we expect
#	[ "$(readlink -f "$JAVA_HOME")" = "$(docker-java-home)" ]; \
#	\
## update-alternatives so that future installs of other OpenJDK versions don't change /usr/bin/java
#	update-alternatives --get-selections | awk -v home="$(readlink -f "$JAVA_HOME")" 'index($3, home) == 1 { $2 = "manual"; print | "update-alternatives --set-selections" }'; \
## ... and verify that it actually worked for one of the alternatives we care about
#	update-alternatives --query java | grep -q 'Status: manual'
    update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# see CA_CERTIFICATES_JAVA_VERSION notes above
#RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

###
# ElasticSearch install
# From https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

# Download and install the public signing key.
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# You may need to install the apt-transport-https package on Debian before proceeding.
RUN apt-get install apt-transport-https -y --no-install-recommends
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

RUN apt-get update && sudo apt-get install elasticsearch -y --no-install-recommends

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

COPY config ./config

# Tugboat doesn't use volumes like this.
#VOLUME /usr/share/elasticsearch/data

COPY docker-entrypoint.sh /

# No need to expose ports for Tugboat.
# EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
