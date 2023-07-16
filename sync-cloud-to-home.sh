#!/bin/bash

# Possible sources dropbox, onedrive and gdrive
BACKUP_SOURCE='dropbox'

FOLDER_NAME=Secrets
rclone sync $BACKUP_SOURCE-sealed:/Sealed/ ~/$FOLDER_NAME/ -uv --progress --exclude ".**"

FOLDER_NAME=Documents
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uv --progress --exclude ".**"

FOLDER_NAME=Pictures
rclone sync $BACKUP_SOURCE:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uv --progress --exclude ".**"

