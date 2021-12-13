#!/bin/bash
NODE_NAME=node-v16.13.1-linux-x64
NODE_HOME=$HOME/apps/nodejs
mkdir -p $NODE_HOME
chmod -R a+rw $NODE_HOME
cd $NODE_HOME
if [ ! -f "$NODE_NAME.tar.xz" ]; then
    curl --progress-bar -L -O "https://nodejs.org/dist/v16.13.1/$NODE_NAME.tar.xz"
fi
if [ ! -d "$NODE_NAME" ]; then
	tar -xvf "$NODE_NAME.tar.xz"
fi
grep NODE_HOME "$HOME/.bashrc"
if [ ! $? -eq 0 ]; then
    echo "" >> $HOME/.bashrc
    echo "export NODE_HOME=$NODE_HOME/$NODE_NAME" >> $HOME/.bashrc
    echo 'export PATH="$NODE_HOME/bin:$PATH"' >> $HOME/.bashrc
fi
