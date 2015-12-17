FROM localhost:5000/ubuntu

RUN apt-get -y install apache2 apache2-utils && \
    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY apache2-docker /usr/local/sbin/apache2-docker
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf

LABEL tugboat.ready="curl -I http://localhost"

CMD ["apache2-docker"]
