#!/bin/bash

# Possible sources dropbox, onedrive and gdrive
BACKUP_SOURCE='dropbox'

printf "Using backup source ${BACKUP_SOURCE}"
FOLDER_NAME=Secrets
rclone sync $BACKUP_SOURCE-sealed:/Sealed/ ~/$FOLDER_NAME/ -uP --exclude ".**"

FOLDER_NAME=Documents
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uP --exclude ".**" --exclude "*.alfredpreferences/"
tar --mac-metadata -xvpf ~/Documents/Preferences/Alfred.tar.xz --strip-components=4 -C ~/Documents/Preferences/

FOLDER_NAME=Pictures
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uP --exclude ".**"
