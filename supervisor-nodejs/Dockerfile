FROM localhost:5000/supervisor

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_5.x "$(lsb_release -sc)" main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get -y install nodejs
