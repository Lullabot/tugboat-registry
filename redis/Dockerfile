FROM localhost:5000/ubuntu

RUN mkdir /etc/service/redis-server && \

    apt-get update && \
    apt-get -y --no-install-recommends install redis-server && \
    sed -i '/^daemonize/c\daemonize no' /etc/redis/redis.conf && \
    sed -i '/^bind/d' /etc/redis/redis.conf && \
    sed -i '/^logfile/c\logfile ""' /etc/redis/redis.conf && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY run /etc/service/redis-server/run

LABEL tugboat.ready="nc -z localhost 6379"
