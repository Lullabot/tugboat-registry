FROM localhost:5000/ubuntu

RUN mkdir /etc/service/mariadb && \

    apt-get update && \
    apt-get -y --no-install-recommends install mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY my.cnf /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & \
    sleep 10 && \
    mysql -e "GRANT ALL ON *.* TO tugboat@'%' IDENTIFIED BY 'tugboat' WITH GRANT OPTION; FLUSH PRIVILEGES"

LABEL tugboat.ready="mysqladmin ping"

COPY run /etc/service/mariadb/run
