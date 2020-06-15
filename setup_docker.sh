#!/bin/bash
source /etc/upstream-release/lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRIB_CODENAME stable"
apt-get update
apt-get install -y docker-ce
echo "{\"experimental\": true}" >> /etc/docker/daemon.json

curl --progress-bar -L https://github.com/docker/compose/releases/download/1.26.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker vagrant
