FROM localhost:5000/ubuntu

RUN apt-get -y install couchdb

COPY couchdb-docker /usr/local/bin/couchdb-docker
COPY httpd.ini /etc/couchdb/default.d/httpd.ini

LABEL tugboat.ready="curl -I http://127.0.0.1:5984"

CMD ["couchdb-docker"]
