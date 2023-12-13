#!/bin/bash
source /etc/upstream-release/lsb-release
sudo sh -c 'curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -'
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $DISTRIB_CODENAME main"
sudo apt update
sudo apt install -y terraform
# run as non root
echo "run 'terraform -install-autocomplete' w/o sudo to install autocomplete and restart your shell."
#terraform -install-autocomplete