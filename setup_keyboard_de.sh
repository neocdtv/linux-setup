#!/bin/bash
localectl set-keymap de
echo "" >> $USER_HOME/.bashrc    
echo 'setxkbmap de'  >> $USER_HOME/.bashrc
