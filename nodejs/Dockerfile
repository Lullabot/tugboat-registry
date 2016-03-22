FROM localhost:5000/ubuntu

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_5.x "$(lsb_release -sc)" main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
