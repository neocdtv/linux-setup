#!/bin/bash
VSCODE_NAME=code_1.63.0-1638855526_amd64
VSCODE_NAME_EXTRACTED=dbeaver
VSCODE_HOME=$HOME/apps/vscode
INSTALL_HOME=/usr/share/code
mkdir -p $VSCODE_HOME
cd $VSCODE_HOME
if [ ! -f "$VSCODE_NAME.deb" ]; then
    curl --progress-bar -L -O "https://az764295.vo.msecnd.net/stable/7db1a2b88f7557e0a43fec75b6ba7e50b3e9f77e/$VSCODE_NAME.deb"
fi

if [ ! -d "$INSTALL_HOME" ]; then
	sudo dpkg -i "$VSCODE_NAME.deb"
fi

LAUNCHER=$HOME/Desktop/VSCode.desktop

if [ ! -f "$LAUNCHER" ]; then
    echo '#!/usr/bin/env xdg-open' >> $LAUNCHER
    echo '[Desktop Entry]' >> $LAUNCHER
    echo 'Version=1.0' >> $LAUNCHER
    echo 'Type=Application' >> $LAUNCHER
    echo 'Terminal=false' >> $LAUNCHER
    echo "Icon=$INSTALL_HOME/resources/app/resources/linux/code.png" >> $LAUNCHER
    echo "Icon[en_US]=$INSTALL_HOME/resources/app/resources/linux/code.png" >> $LAUNCHER
    echo 'Name[en_US]=VSCode' >> $LAUNCHER
    echo "Exec=/usr/bin/code" >> $LAUNCHER
    echo 'Name=VSCode' >> $LAUNCHER

    chmod a+rwx $LAUNCHER
fi

