#!/bin/bash
source /etc/upstream-release/lsb-release
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $DISTRIB_CODENAME main"
apt update
apt install terraform