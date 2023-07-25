#!/bin/bash

OS=$(uname)

# Possible sources dropbox, onedrive and gdrive
BACKUP_SOURCE='dropbox'

printf "Using backup source ${BACKUP_SOURCE}"
FOLDER_NAME=Secrets
rclone sync $BACKUP_SOURCE-sealed:/Sealed/ ~/$FOLDER_NAME/ -uP --exclude ".**"

FOLDER_NAME=Documents
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uP --exclude ".**" --exclude "*.alfredpreferences/"
if [ "$OS" == "Darwin" ]; then
    echo "Running on macOS"
    cd ~/Documents/Preferences
    tar --mac-metadata -xvpf Alfred.tar.xz
    cd ~
fi

FOLDER_NAME=Pictures
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uP --exclude ".**"
