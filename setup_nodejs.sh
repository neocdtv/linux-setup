#!/bin/bash
NODE_NAME=node-v20.9.0-linux-x64
NODE_HOME=$HOME/Apps/nodejs
mkdir -p $NODE_HOME
chmod -R a+rw $NODE_HOME
cd $NODE_HOME
if [ ! -f "$NODE_NAME.tar.xz" ]; then
    curl --progress-bar -L -O "https://nodejs.org/dist/v20.9.0/$NODE_NAME.tar.xz"
fi
if [ ! -d "$NODE_NAME" ]; then
	tar -xvf "$NODE_NAME.tar.xz"
fi
echo "" >> $HOME/.bashrc
echo "export NODE_HOME=$NODE_HOME/$NODE_NAME" >> $HOME/.bashrc
echo 'export PATH="$NODE_HOME/bin:$PATH"' >> $HOME/.bashrc
