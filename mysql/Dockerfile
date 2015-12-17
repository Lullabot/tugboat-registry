FROM ubuntu

RUN apt-get update && \
    apt-get -y install build-essential curl git && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf && \

    apt-get -y install mysql-server

RUN /usr/sbin/mysqld & \
    sleep 10 && \
    mysql -e "GRANT ALL ON *.* TO tugboat@'%' IDENTIFIED BY 'tugboat' WITH GRANT OPTION; FLUSH PRIVILEGES"

LABEL tugboat.ready="mysqladmin ping"

COPY tugboat.cnf /etc/mysql/conf.d/tugboat.cnf

CMD ["/usr/bin/mysqld_safe"]
