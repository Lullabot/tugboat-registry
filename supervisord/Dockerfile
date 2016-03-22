FROM localhost:5000/ubuntu

RUN mkdir /etc/service/supervisord && \

    apt-get update && \
    apt-get -y install supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

LABEL tugboat.ready="ls /var/run/supervisor.sock"
