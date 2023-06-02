#!/bin/bash
HELM_DIR=$HOME/apps/helm
mkdir -p $HELM_DIR
cd $HELM_DIR
curl --progress-bar -O https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz
tar -xzvf helm-v3.12.0-linux-amd64.tar.gz
rm helm-v3.12.0-linux-amd64.tar.gz
mv linux-amd64 helm-v3.12.0
chmod -R a+rwx helm-v3.12.0
echo "" >> $HOME/.bashrc        
echo "export HELM_HOME=$HELM_DIR/helm-v3.12.0"  >> $HOME/.bashrc
echo 'export PATH="$HELM_HOME:$PATH"'  >> $HOME/.bashrc 

