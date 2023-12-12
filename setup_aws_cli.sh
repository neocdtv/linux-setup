#!/bin/bash
AWS_CLI_NAME=awscli-exe-linux-x86_64
AWS_CLI_NAME_EXTRACTED=aws
AWS_CLI_HOME=$HOME/Apps/awscliv2
mkdir -p $AWS_CLI_HOME
cd $AWS_CLI_HOME
if [ ! -f "$AWS_CLI_NAME.zip" ]; then
    curl --progress-bar -L -O "https://awscli.amazonaws.com/$AWS_CLI_NAME.zip"
fi
if [ ! -d "$AWS_CLI_NAME_EXTRACTED" ]; then
	unzip "$AWS_CLI_NAME.zip"
fi
sudo ./aws/install