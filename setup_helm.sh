#!/bin/bash
VERSION="v3.12.0"
HELM_DIR=$HOME/Apps/helm
mkdir -p $HELM_DIR
cd $HELM_DIR
curl --progress-bar -O "https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz"
tar -xzvf "helm-$VERSION-linux-amd64.tar.gz"
rm "helm-$VERSION-linux-amd64.tar.gz"
mv linux-amd64 "helm-$VERSION"
chmod a+rwx "helm-$VERSION"
echo "" >> $HOME/.bashrc        
echo "export HELM_HOME=$HELM_DIR/helm-$VERSION"  >> $HOME/.bashrc
echo 'export PATH="$HELM_HOME:$PATH"'  >> $HOME/.bashrc 

