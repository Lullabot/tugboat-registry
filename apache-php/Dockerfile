FROM ubuntu

RUN apt-get update && \
    apt-get -y install build-essential && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf && \

    apt-get -y install apache2 apache2-utils libapache2-mod-php5 && \
    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY apache2-docker /usr/local/sbin/apache2-docker
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf
COPY uploadprogress.ini /etc/php5/mods-available/uploadprogress.ini

RUN apt-get -y install imagemagick php-pear php5-cli php5-curl php5-dev php5-gd php5-imagick php5-intl php5-ldap php5-mcrypt php5-memcached php5-mysql php5-oauth php5-xmlrpc php5-xsl && \
    pecl install uploadprogress && \
    php5enmod -s apache2 uploadprogress

LABEL tugboat.ready="curl -I http://localhost"

CMD ["apache2-docker"]
