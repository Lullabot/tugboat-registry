FROM ubuntu

RUN apt-get update && \
    apt-get -y install build-essential git && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf
