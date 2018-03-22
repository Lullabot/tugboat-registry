FROM localhost:5000/apache

RUN export PHP_VERSION=7.1 && \
    apt-get update && \
    apt-get install -y python-software-properties software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
      php${PHP_VERSION} \
      php${PHP_VERSION}-bcmath \
      php${PHP_VERSION}-bz2 \
      php${PHP_VERSION}-cli \
      php${PHP_VERSION}-common \
      php${PHP_VERSION}-curl \
      php${PHP_VERSION}-dev \
      php${PHP_VERSION}-enchant \
      php${PHP_VERSION}-fpm \
      php${PHP_VERSION}-gd \
      php${PHP_VERSION}-imap \
      php${PHP_VERSION}-intl \
      php${PHP_VERSION}-json \
      php${PHP_VERSION}-mbstring \
      php${PHP_VERSION}-mcrypt \
      php${PHP_VERSION}-mysql \
      php${PHP_VERSION}-opcache \
      php${PHP_VERSION}-pgsql \
      php${PHP_VERSION}-phpdbg \
      php${PHP_VERSION}-pspell \
      php${PHP_VERSION}-readline \
      php${PHP_VERSION}-recode \
      php${PHP_VERSION}-soap \
      php${PHP_VERSION}-sqlite3 \
      php${PHP_VERSION}-tidy \
      php${PHP_VERSION}-xml \
      php${PHP_VERSION}-xmlrpc \
      php${PHP_VERSION}-xsl \
      php${PHP_VERSION}-zip \
      libapache2-mod-php${PHP_VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
