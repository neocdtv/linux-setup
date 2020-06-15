#!/bin/bash
mkdir -p $HOME/Downloads
cd $HOME/Downloads        	    
apt install -y libaio1 libaio-dev build-essential dkms linux-headers-$(uname -r) gcc make perl
curl --progress-bar -o VBoxGuestAdditions.iso  https://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mkdir -p /media/cdrom
mount -o loop ./VBoxGuestAdditions.iso /media/cdrom
cd /media/cdrom
printf yes\\n | ./VBoxLinuxAdditions.run   
