#!/bin/bash
MAVEN_DIR=$HOME/Apps/maven
mkdir -p $MAVEN_DIR
cd $MAVEN_DIR
curl --progress-bar -O https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xzvf apache-maven-3.9.6-bin.tar.gz
rm apache-maven-3.9.6-bin.tar.gz
chmod -R a+rwx apache-maven-3.9.6
echo "" >> $HOME/.bashrc        
echo "export M2_HOME=$MAVEN_DIR/apache-maven-3.9.6"  >> $HOME/.bashrc
echo 'export PATH="$M2_HOME/bin:$PATH"'  >> $HOME/.bashrc 
