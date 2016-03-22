FROM localhost:5000/ubuntu

RUN mkdir /etc/service/memcached && \

    apt-get update && \
    apt-get -y --no-install-recommends install memcached && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY run /etc/service/memcached/run
COPY memcached.conf /etc/memcached.conf

LABEL tugboat.ready="nc -z localhost 11211"
