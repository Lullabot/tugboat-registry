FROM ubuntu

RUN apt-get update && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf && \

    apt-get -y install apache2 && \
    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY apache2-docker /usr/local/sbin/apache2-docker
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf

CMD ["apache2-docker"]
