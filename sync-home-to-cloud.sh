#!/bin/bash

OS=$(uname)

#export RCLONE_CONFIG_PASS='changeit'
FOLDER_NAME=Secrets
echo "Upload Secrets"
rclone sync $FOLDER_NAME/ dropbox-sealed:/Sealed/ -uP --exclude ".**"

if [ "$OS" == "Darwin" ]; then
    echo "Running on macOS"
    cd ~/Documents/Preferences
    tar --mac-metadata -cvpf Alfred.tar.xz Alfred.alfredpreferences/
    cd ~
fi

FOLDER_NAME=Documents
echo "Upload ${FOLDER_NAME}"
rclone sync ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uP --exclude ".**" --exclude "*.alfredpreferences/"
rclone sync ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uP --exclude ".**" --exclude "*.alfredpreferences/"
rclone sync ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uP --exclude ".**" --exclude "*.alfredpreferences/"

FOLDER_NAME=Pictures
echo "Upload ${FOLDER_NAME}"
rclone sync ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uP --exclude ".**"
