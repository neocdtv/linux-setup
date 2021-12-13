#!/bin/bash
# next line is relvant for linux mint, where the ubuntu version is hidden in lsb-release-> $DISTRIB
source /etc/upstream-release/lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRIB_CODENAME stable"
apt-get update
apt-get install -y docker-ce
echo "{\"experimental\": true}" >> /etc/docker/daemon.json

apt install -y jq
DOCKER_COMPOSE_LATEST=`curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq -r .tag_name`
curl --progress-bar -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_LATEST/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker $SUDO_USER
service docker restart
