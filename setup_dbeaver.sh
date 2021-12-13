#!/bin/bash
DBEAVER_NAME=dbeaver-ce-latest-linux.gtk.x86_64-nojdk
DBEAVER_NAME_EXTRACTED=dbeaver
DBEAVER_HOME=$HOME/apps/dbeaver
mkdir -p $DBEAVER_HOME
cd $DBEAVER_HOME
if [ ! -f "$DBEAVER_NAME.tar.gz" ]; then
    curl --progress-bar -L -O "https://dbeaver.io/files/$DBEAVER_NAME.tar.gz"
fi
if [ ! -d "$DBEAVER_NAME_EXTRACTED" ]; then
	tar -xvf "$DBEAVER_NAME.tar.gz"
fi

LAUNCHER=$HOME/Desktop/DBeaver.desktop

if [ ! -f "$LAUNCHER" ]; then
    echo '#!/usr/bin/env xdg-open' >> $LAUNCHER
    echo '[Desktop Entry]' >> $LAUNCHER
    echo 'Version=1.0' >> $LAUNCHER
    echo 'Type=Application' >> $LAUNCHER
    echo 'Terminal=false' >> $LAUNCHER
    echo "Icon=$DBEAVER_HOME/$DBEAVER_NAME_EXTRACTED/icon.xpm" >> $LAUNCHER
    echo "Icon[en_US]=$DBEAVER_HOME/$DBEAVER_NAME_EXTRACTED/icon.xpm" >> $LAUNCHER
    echo 'Name[en_US]=DBeaver' >> $LAUNCHER
    echo "Exec=$DBEAVER_HOME/$DBEAVER_NAME_EXTRACTED/dbeaver" >> $LAUNCHER
    echo 'Name=DBeaver' >> $LAUNCHER

    chmod a+rwx $LAUNCHER
fi

