FROM localhost:5000/ubuntu

RUN mkdir /etc/service/mysql && \

    apt-get update && \
    apt-get -y --no-install-recommends install mysql-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY my.cnf /etc/mysql/my.cnf
COPY mysql.mk /usr/share/tugboat/mysql.mk

RUN find /var/lib/mysql -type f -exec touch {} \; && \
    /usr/sbin/mysqld & \
    sleep 10 && \
    mysql -e "GRANT ALL ON *.* TO tugboat@'%' IDENTIFIED BY 'tugboat' WITH GRANT OPTION; FLUSH PRIVILEGES"

LABEL tugboat.ready="mysqladmin ping"

COPY run /etc/service/mysql/run
