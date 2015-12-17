FROM ubuntu

RUN apt-get update && \
    apt-get -y install apt-transport-https build-essential curl git && \

    apt-get -y install ssmtp && \
    sed -i s/mailhub=mail/mailhub=172.17.42.1/ /etc/ssmtp/ssmtp.conf && \
    sed -i s/^hostname=/#hostname=/ /etc/ssmtp/ssmtp.conf && \

    echo "[user]" > ~/.gitconfig && \
    echo "    email = root@tugboat.qa" >> ~/.gitconfig && \
    echo "    name = Tugboat" >> ~/.gitconfig
