#!/bin/bash

CUR_DIR=$(pwd)

### Install Dependencies ###
sudo apt-get install screen

if [ -z "$(command -v node)" ]; then 
	curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash - 
	sudo apt-get install -y nodejs
fi

npm install
sed -i "s|/path/to/the/exe|$CUR_DIR/telegram|g" "telegram.desktop"
sed -i "s|/path/to/the/dir|$CUR_DIR|g" "telegram.desktop"
sed -i "s|/path/to/the/dir|$CUR_DIR|g" "telegram"
chmod u+x telegram

cp "telegram.desktop" "$HOME/.local/share/applications"
