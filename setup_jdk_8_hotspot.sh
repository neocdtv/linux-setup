#!/bin/bash
JDK_ZULU_8=$HOME/Apps/jdks/hotspot/zulu
mkdir -p $JDK_ZULU_8
cd $JDK_ZULU_8
curl --progress-bar -L -O https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jdk8.0.265-linux_x64.tar.gz
tar -xzvf zulu8.48.0.53-ca-jdk8.0.265-linux_x64.tar.gz
rm zulu8.48.0.53-ca-jdk8.0.265-linux_x64.tar.gz
chmod -R a+rwx zulu8.48.0.53-ca-jdk8.0.265-linux_x64

echo "" >> $HOME/.bashrc
echo 'export MAVEN_OPTS_HOTSPOT="-Xnoclassgc -Xms1g -Xmx2g -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseParallelGC -Xverify:none -Xshare:on"' >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
echo "jdk_8_hotspot() {" >> $HOME/.bashrc
echo "	export JAVA_HOME=$JDK_ZULU_8/zulu8.48.0.53-ca-jdk8.0.265-linux_x64"  >> $HOME/.bashrc
echo '	export PATH="$JAVA_HOME/bin:$PATH"'  >> $HOME/.bashrc
echo '	export MAVEN_OPTS="$MAVEN_OPTS_HOTSPOT"' >> $HOME/.bashrc
echo "  	if [ ! -f '$JDK_ZULU_8/zulu8.48.0.53-ca-jdk8.0.265-linux_x64/lib/server/classes.jsa' ]" >> $HOME/.bashrc
echo "	    then" >> $HOME/.bashrc
echo "		    java -Xshare:dump" >> $HOME/.bashrc
echo "   fi" >> $HOME/.bashrc
echo "}" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc