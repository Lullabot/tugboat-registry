FROM localhost:5000/ubuntu

RUN mkdir /etc/service/apache2 && \
    mkdir /etc/service/apache2-access-forwarder && \
    mkdir /etc/service/apache2-error-forwarder && \

    apt-get update && \
    apt-get -y --no-install-recommends install apache2 apache2-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    a2enmod expires rewrite && \
    rm -rf /var/www/html && \
    ln -s /var/lib/tugboat/docroot /var/www/html && \
    mkdir /var/www/__tugboat && \
    echo "umask 0002" >> /etc/apache2/envvars

COPY run /etc/service/apache2/run
COPY access-forwarder.runit /etc/service/apache2-access-forwarder/run
COPY error-forwarder.runit /etc/service/apache2-error-forwarder/run
COPY conf-available/security.conf /etc/apache2/conf-available/security.conf
COPY sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY .htaccess /var/www/__tugboat/.htaccess
COPY FreightSansProBold.base64 /var/www/__tugboat/FreightSansProBold.base64
COPY FreightSansProBook.base64 /var/www/__tugboat/FreightSansProBook.base64
COPY FreightSansProMedium.base64 /var/www/__tugboat/FreightSansProMedium.base64
COPY noindex.shtml /var/www/__tugboat/noindex.shtml
COPY noservice.shtml /var/www/__tugboat/noservice.shtml
COPY checkmark.svg /var/www/__tugboat/checkmark.svg
COPY documentation.svg /var/www/__tugboat/documentation.svg
COPY email.svg /var/www/__tugboat/email.svg
COPY slack.svg /var/www/__tugboat/slack.svg

LABEL tugboat.ready="curl -I http://127.0.0.1"
