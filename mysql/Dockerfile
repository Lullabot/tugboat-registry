FROM localhost:5000/ubuntu

RUN apt-get -y install mysql-server

RUN /usr/sbin/mysqld & \
    sleep 10 && \
    mysql -e "GRANT ALL ON *.* TO tugboat@'%' IDENTIFIED BY 'tugboat' WITH GRANT OPTION; FLUSH PRIVILEGES"

LABEL tugboat.ready="mysqladmin ping"

COPY tugboat.cnf /etc/mysql/conf.d/tugboat.cnf

CMD ["/usr/bin/mysqld_safe"]
