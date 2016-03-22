FROM localhost:5000/ubuntu

RUN mkdir /etc/service/apache2 && \

    apt-get update && \
    apt-get -y install apache2 apache2-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    echo "umask 0002" >> /etc/apache2/envvars && \
    sed -i '/^ErrorLog / cErrorLog /dev/stderr' /etc/apache2/apache2.conf && \
    sed -i '/^CustomLog / cCustomLog /dev/stdout vhost_combined' /etc/apache2/conf-available/other-vhosts-access-log.conf

COPY run /etc/service/apache2/run
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf

LABEL tugboat.ready="curl -I http://127.0.0.1"
