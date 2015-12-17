FROM localhost:5000/ubuntu

COPY rsyslog.conf /etc/rsyslog.conf

LABEL tugboat.ready="ls /dev/log"

CMD ["rsyslogd", "-n"]
