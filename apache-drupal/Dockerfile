FROM localhost:5000/apache-php

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    mkdir -p /root/.composer && \

    apt-get -y install mysql-client && \
    git clone https://github.com/drush-ops/drush.git /usr/local/src/drush && \
    cd /usr/local/src/drush && \
    git checkout 6.7.0 && \
    ln -s /usr/local/src/drush/drush /usr/bin/drush
