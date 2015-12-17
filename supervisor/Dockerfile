FROM localhost:5000/ubuntu

RUN apt-get -y install supervisor

LABEL tugboat.ready="ls /var/run/supervisor.sock"

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
