FROM localhost:5000/ubuntu

RUN apt-get -y install memcached

COPY memcached-docker /usr/local/bin/memcached-docker
COPY memcached.conf /etc/memcached.conf

LABEL tugboat.ready="nc -z localhost 11211"

CMD ["memcached-docker"]
