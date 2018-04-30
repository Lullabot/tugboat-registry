FROM localhost:5000/mysql

RUN make -C /usr/share/tugboat install-mysql-5.6 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
