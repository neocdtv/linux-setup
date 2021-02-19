#!/bin/bash
SCRIPT_NAME=$1
cd $SCRIPTS_DIR
curl -O https://raw.githubusercontent.com/neocdtv/vagrant-boxes/master/scripts/$SCRIPT_NAME
chmod a+x $SCRIPT_NAME
./$SCRIPT_NAME
cd $USER_HOME
