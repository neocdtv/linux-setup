#!/bin/bash
VSCODE_VERSION=latest # or e.g. 1.83.1 
VSCODE_NAME="latest.deb"
VSCODE_HOME=$HOME/apps/vscode
INSTALL_HOME=/usr/share/code
mkdir -p $VSCODE_HOME
cd $VSCODE_HOME
curl --progress-bar -L "https://update.code.visualstudio.com/$VSCODE_VERSION/linux-deb-x64/stable" -o "$VSCODE_NAME"

sudo rm -rf "$INSTALL_HOME"
sudo dpkg -i "$VSCODE_NAME"

LAUNCHER=$HOME/Desktop/VSCode.desktop

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
