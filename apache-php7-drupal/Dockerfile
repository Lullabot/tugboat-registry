FROM localhost:5000/apache-php7

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    mkdir -p /root/.composer && \

    apt-get update && \
    apt-get -y --no-install-recommends install mysql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    git clone https://github.com/drush-ops/drush.git /usr/local/src/drush && \
    cd /usr/local/src/drush && \
    git checkout 8.1.15 && \
    ln -s /usr/local/src/drush/drush /usr/bin/drush
