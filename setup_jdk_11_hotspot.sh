#!/bin/bash
JDK_ZULU=$HOME/Apps/jdks/hotspot/zulu
mkdir -p $JDK_ZULU
cd $JDK_ZULU
curl --progress-bar -L -O https://cdn.azul.com/zulu/bin/zulu11.39.15-ca-jdk11.0.7-linux_x64.tar.gz
tar -xzvf zulu11.39.15-ca-jdk11.0.7-linux_x64.tar.gz
rm zulu11.39.15-ca-jdk11.0.7-linux_x64.tar.gz
chmod -R a+rwx zulu11.39.15-ca-jdk11.0.7-linux_x64

echo "" >> $HOME/.bashrc
echo 'export MAVEN_OPTS_HOTSPOT="-Xnoclassgc -Xms1g -Xmx2g -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseParallelGC -Xverify:none -Xshare:on"' >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
echo "jdk_11_hotspot() {" >> $HOME/.bashrc
echo "	export JAVA_HOME=$JDK_ZULU/zulu11.39.15-ca-jdk11.0.7-linux_x64"  >> $HOME/.bashrc
echo '	export PATH="$JAVA_HOME/bin:$PATH"'  >> $HOME/.bashrc
echo '	export MAVEN_OPTS="$MAVEN_OPTS_HOTSPOT"' >> $HOME/.bashrc
echo "  	if [ ! -f '$JDK_ZULU/zulu11.39.15-ca-jdk11.0.7-linux_x64/lib/server/classes.jsa' ]" >> $HOME/.bashrc
echo "	    then" >> $HOME/.bashrc
echo "		    java -Xshare:dump" >> $HOME/.bashrc
echo "   fi" >> $HOME/.bashrc
echo "}" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
# configure hotspot 11 as default jdk
echo "jdk_11_hotspot" >> $HOME/.bashrc