FROM localhost:5000/ubuntu

RUN mkdir /etc/service/couchdb && \

    apt-get update && \
    apt-get -y install couchdb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY run /etc/service/couchdb/run
COPY httpd.ini /etc/couchdb/default.d/httpd.ini

LABEL tugboat.ready="curl -I http://127.0.0.1:5984"
