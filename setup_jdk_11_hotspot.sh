#!/bin/bash
JDK_NAME=zulu11.39.15-ca-jdk11.0.7-linux_x64
JDK_HOME=$HOME/apps/jdks/hotspot/zulu
mkdir -p $JDK_HOME
cd $JDK_HOME
if [ ! -f "$JDK_NAME.tar.gz" ]; then
    curl --progress-bar -L -O "https://cdn.azul.com/zulu/bin/$JDK_NAME.tar.gz"
fi
if [ ! -d "$JDK_NAME" ]; then
	tar -xzvf "$JDK_NAME.tar.gz"
fi

JDK_FUNCTION_NAME="jdk_11_hotspot";

grep $JDK_FUNCTION_NAME "$HOME/.bashrc"
if [ ! $? -eq 0 ]; then
  # TODO: change to multiline string?
  echo "" >> $HOME/.bashrc
  echo 'export MAVEN_OPTS_HOTSPOT="-Xnoclassgc -Xms1g -Xmx2g -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseParallelGC -Xverify:none -Xshare:on"' >> $HOME/.bashrc
  echo "" >> $HOME/.bashrc
  echo "$JDK_FUNCTION_NAME() {" >> $HOME/.bashrc
  echo "	export JAVA_HOME=$JDK_HOME/$JDK_NAME"  >> $HOME/.bashrc
  echo '	export PATH="$JAVA_HOME/bin:$PATH"'  >> $HOME/.bashrc
  echo '	export MAVEN_OPTS="$MAVEN_OPTS_HOTSPOT"' >> $HOME/.bashrc
  echo "  	if [ ! -f '$JDK_HOME/$JDK_NAME/lib/server/classes.jsa' ]" >> $HOME/.bashrc
  echo "	    then" >> $HOME/.bashrc
  echo "		    java -Xshare:dump" >> $HOME/.bashrc
  echo "   fi" >> $HOME/.bashrc
  echo "}" >> $HOME/.bashrc
  echo "" >> $HOME/.bashrc
  # configure hotspot 11 as default jdk
  echo "$JDK_FUNCTION_NAME" >> $HOME/.bashrc
fi