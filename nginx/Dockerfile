FROM localhost:5000/ubuntu

RUN mkdir /etc/service/nginx && \
    mkdir /etc/service/nginx-access-forwarder && \
    mkdir /etc/service/nginx-error-forwarder && \

    apt-get update && \
    apt-get -y --no-install-recommends install nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    rm -rf /usr/share/nginx/html && \
    ln -s /var/lib/tugboat/docroot /usr/share/nginx/html

COPY run /etc/service/nginx/run
COPY access-forwarder.runit /etc/service/nginx-access-forwarder/run
COPY error-forwarder.runit /etc/service/nginx-error-forwarder/run

LABEL tugboat.ready="curl -I http://127.0.0.1"
