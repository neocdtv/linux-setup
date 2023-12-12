#!/bin/bash
INTELLIJ_NAME=ideaIU-2019.2.4
INTELLIJ_NAME_EXTRACTED=idea-IU-192.7142.36
INTELLIJ_HOME=$HOME/Apps/intellij
mkdir -p $INTELLIJ_HOME
cd $INTELLIJ_HOME
if [ ! -f "$INTELLIJ_NAME.tar.gz" ]; then
    curl --progress-bar -L -O "https://download.jetbrains.com/idea/$INTELLIJ_NAME.tar.gz"
fi
if [ ! -d "$INTELLIJ_NAME_EXTRACTED" ]; then
	tar -xvf "$INTELLIJ_NAME.tar.gz"
fi

LAUNCHER=$HOME/Desktop/Intellij.desktop

if [ ! -f "$LAUNCHER" ]; then
    echo '#!/usr/bin/env xdg-open' >> $LAUNCHER
    echo '[Desktop Entry]' >> $LAUNCHER
    echo 'Version=1.0' >> $LAUNCHER
    echo 'Type=Application' >> $LAUNCHER
    echo 'Terminal=false' >> $LAUNCHER
    echo "Icon=$INTELLIJ_HOME/$INTELLIJ_NAME_EXTRACTED/bin/idea.svg" >> $LAUNCHER
    echo "Icon[en_US]=$INTELLIJ_HOME/$INTELLIJ_NAME_EXTRACTED/bin/idea.svg" >> $LAUNCHER
    echo 'Name[en_US]=Intellij' >> $LAUNCHER
    echo "Exec=$INTELLIJ_HOME/$INTELLIJ_NAME_EXTRACTED/bin/idea.sh" >> $LAUNCHER
    echo 'Name=Intellij' >> $LAUNCHER

    chmod a+rwx $LAUNCHER
fi

