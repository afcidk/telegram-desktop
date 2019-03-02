#!/bin/sh

CUR_DIR=$(pwd)

npm install
sed -i "s|/path/to/the/exe|$CUR_DIR/telegram|g" "telegram.desktop"
sed -i "s|/path/to/the/dir|$CUR_DIR|g" "telegram.desktop"
sed -i "s|/path/to/the/dir|$CUR_DIR|g" "telegram"
chmod u+x telegram

cp "telegram.desktop" "$HOME/.local/share/applications"
