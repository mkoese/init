#!/bin/bash

#export RCLONE_CONFIG_PASS='changeit'
FOLDER_NAME=Secrets
echo "Upload Secrets"
rclone sync $FOLDER_NAME/ dropbox-sealed:/Sealed/ -uP --exclude ".**"

FOLDER_NAME=Documents
echo "Upload ${FOLDER_NAME}"
rclone sync ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uP --exclude ".**"

FOLDER_NAME=Pictures
echo "Upload ${FOLDER_NAME}"
rclone sync ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uP --exclude ".**"
rclone sync ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uP --exclude ".**"
