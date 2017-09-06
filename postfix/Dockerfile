FROM localhost:5000/ubuntu

RUN mkdir /etc/service/postfix && \
    mkdir /etc/service/mail.log-forwarder && \
    mkdir /etc/service/mail.err-forwarder && \

    apt-get update && \
    echo postfix postfix/main_mailer_type string "'Internet Site'" | debconf-set-selections && \
    echo postfix postfix/mynetworks string "127.0.0.0/8 10.0.0.0/8" | debconf-set-selections && \
    echo postfix postfix/mailname string temporary.example.com | debconf-set-selections && \
    apt-get -y --no-install-recommends install postfix && \
    postconf -e mydestination="localhost.localdomain, localhost" && \
    postconf -e smtpd_banner='$myhostname ESMTP $mail_name' && \
    postconf -# myhostname && \
    postconf -e inet_protocols=ipv4 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY run /etc/service/postfix/run
COPY mail.log-forwarder.runit /etc/service/mail.log-forwarder/run
COPY mail.err-forwarder.runit /etc/service/mail.err-forwarder/run

LABEL tugboat.ready="nc -z localhost 25"
