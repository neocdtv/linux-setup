#!/bin/bash
# next line is relvant for linux mint, where the ubuntu version is hidden in lsb-release-> $DISTRIB
source /etc/upstream-release/lsb-release

# Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
#sudo chmod a+r /etc/apt/trusted.gpg.d/docker.gpg

# Add the repository to Apt sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRIB_CODENAME stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt install -y jq
DOCKER_COMPOSE_LATEST=`curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq -r .tag_name`
sudo curl --progress-bar -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_LATEST/docker-compose-`uname -s`-`uname -m` -o docker-compose
sudo chmod +x ./docker-compose 
sudo mv ./docker-compose /usr/local/bin/docker-compose

# if you run the script mulitple times, you will get multiple entries in deamon.json, which will cause docker to throw strange errors,
# so watch out with this line, deamon.json, needs to contain well formed json, at least {}
# TODO: maybe clear every time deamon.json? but then you will loose other settings, so again watch out
#echo "{\"experimental\": true}" >> /etc/docker/daemon.json

sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
sudo service docker restart
