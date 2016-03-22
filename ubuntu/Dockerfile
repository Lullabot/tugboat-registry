FROM localhost:5000/baseimage

RUN apt-get update && \
    apt-get -y install apt-transport-https build-essential curl git vim && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf && \

    echo "[user]" > ~/.gitconfig && \
    echo "    email = root@tugboat.qa" >> ~/.gitconfig && \
    echo "    name = Tugboat" >> ~/.gitconfig && \

    locale-gen en_US.UTF-8 && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  
