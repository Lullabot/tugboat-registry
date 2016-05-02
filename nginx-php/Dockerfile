FROM localhost:5000/nginx

RUN mkdir /etc/service/php-fpm && \

    apt-get update && \
    apt-get -y --no-install-recommends install imagemagick php5-fpm php-pear php5-cli php5-curl php5-dev php5-gd php5-imagick php5-imap php5-intl php5-ldap php5-mcrypt php5-memcached php5-mysql php5-oauth php5-xmlrpc php5-xsl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY run /etc/service/php-fpm/run
COPY default /etc/nginx/sites-available/default
