FROM localhost:5000/ubuntu

RUN mkdir /etc/service/apache2 && \
    mkdir /etc/service/apache2-access-forwarder && \
    mkdir /etc/service/apache2-error-forwarder && \

    apt-get update && \
    apt-get -y --no-install-recommends install apache2 apache2-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    mkdir /var/www/__tugboat && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY run /etc/service/apache2/run
COPY access-forwarder.runit /etc/service/apache2-access-forwarder/run
COPY error-forwarder.runit /etc/service/apache2-error-forwarder/run
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY noindex.html /var/www/__tugboat/noindex.html

LABEL tugboat.ready="curl -I http://127.0.0.1"
