###
# Install OpenJDK JRE 8
# https://raw.githubusercontent.com/docker-library/openjdk/master/8-jre/Dockerfile
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM localhost:5000/elasticsearch-baseimage

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
