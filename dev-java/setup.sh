#!/bin/bash
# move mkdir and chmod to separate script
mkdir -p /home/vagrant/Apps
mkdir -p /home/vagrant/apps
mkdir -p /home/vagrant/Projects
chmod -R a+rwx /home/vagrant/Apps
chmod -R a+rwx /home/vagrant/apps
chmod -R a+rwx /home/vagrant/Projects
../setup_vbox_additions.sh
../setup_criu.sh
../setup_docker.sh
../setup_intellij.sh
../setup_jdk_11_hotspot.sh
../setup_jdk_11_openj9.sh
../setup_keyboard_de.sh
../setup_maven.sh
../setup_payara_micro.sh
../setup_scite.sh
