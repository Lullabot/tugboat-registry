FROM localhost:5000/apache

RUN apt-get update && \
    apt-get -y --no-install-recommends install imagemagick libapache2-mod-php5 php-pear php5-cli php5-curl php5-dev php5-gd php5-imagick php5-intl php5-ldap php5-mcrypt php5-memcached php5-mysql php5-oauth php5-xmlrpc php5-xsl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY uploadprogress.ini /etc/php5/mods-available/uploadprogress.ini

RUN pecl install uploadprogress && \
    php5enmod -s apache2 uploadprogress
