#!/bin/bash
# move mkdir and chmod to separate script
HOME=/home/vagrant
APPS="$HOME/Apps"
PROJECTS="$HOME/Projects"
USER="vagrant"
GROUP="vagrant"
mkdir -p $APPS
mkdir -p $PROJECTS
sudo chown -R "$USER:$GROUP" $APPS
sudo chown -R "$USER:$GROUP" $PROJECTS

#sudo -u $USER ../setup_vbox_additions.sh
#sudo -u $USER ../setup_docker.sh
#sudo -u $USER ../setup_intellij.sh
sudo -u $USER ../setup_keyboard_de.sh
sudo -u $USER ../setup_maven.sh
sudo -u $USER ../setup_terraform.sh
#sudo -u $USER ../setup_payara_micro.sh
sudo -u $USER ../setup_scite.sh
sudo -u $USER ../setup_vscode.sh
sudo -u $USER ../setup_nodejs.sh
sudo -u $USER ../setup_aws_cli.sh
sudo -u $USER ../setup_dbeaver.sh

#su -c ../setup_criu.sh $USER