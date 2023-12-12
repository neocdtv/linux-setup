#!/bin/bash
# next line is relvant for linux mint, where the ubuntu version is hidden in lsb-release-> $DISTRIB
source /etc/upstream-release/lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRIB_CODENAME stable"
sudo apt-get update
apt-get install -y docker-ce
# if you run the script mulitple times, you will get multiple entries in deamon.json, which will cause docker to throw strange errors,
# so watch out with this line, deamon.json, needs to contain well formed json, at least {}
# TODO: maybe clear every time deamon.json? but then you will loose other settings, so again watch out
#echo "{\"experimental\": true}" >> /etc/docker/daemon.json

apt install -y jq
DOCKER_COMPOSE_LATEST=`curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq -r .tag_name`
curl --progress-bar -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_LATEST/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker $SUDO_USER
chmod 666 /var/run/docker.sock
service docker restart
