FROM localhost:5000/ubuntu

RUN mkdir /etc/service/mongodb && \

    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get update && \
    apt-get -y install mongodb-org && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY run /etc/service/mongodb/run
COPY mongod.conf /etc/mongod.conf

LABEL tugboat.ready="nc -z localhost 27017"
