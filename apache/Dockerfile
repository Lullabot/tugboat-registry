FROM localhost:5000/ubuntu

RUN mkdir /etc/service/apache2 && \
    mkdir /etc/service/apache2-access-forwarder && \
    mkdir /etc/service/apache2-error-forwarder && \

    apt-get update && \
    apt-get -y --no-install-recommends install apache2 apache2-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    a2enmod expires rewrite include && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    mkdir /var/www/__tugboat && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY run /etc/service/apache2/run
COPY access-forwarder.runit /etc/service/apache2-access-forwarder/run
COPY error-forwarder.runit /etc/service/apache2-error-forwarder/run
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY .htaccess \
     noindex.shtml \
     noservice.shtml \
     _checkmark.svg \
     _docroot.shtml \
     _documentation.svg \
     _email.svg \
     _FreightSansProBold.base64 \
     _FreightSansProBook.base64 \
     _FreightSansProMedium.base64 \
     _head.shtml \
     _makefile.shtml \
     _questions.shtml \
     _slack.svg \
     /var/www/__tugboat/

LABEL tugboat.ready="curl -I http://127.0.0.1"
