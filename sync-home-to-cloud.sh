#!/bin/bash

#export RCLONE_CONFIG_PASS='changeit'

rclone copyto sync-cloud-to-home.sh dropbox:sync-cloud-to-home.sh
rclone copyto sync-home-to-cloud.sh dropbox:sync-home-to-cloud.sh

rclone sync Secrets/ dropbox-sealed:/Sealed/ -uv --progress --exclude ".**"

FOLDER_NAME=Documents
rclone sync $FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uv --progress --exclude ".**"
rclone sync $FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uv --progress --exclude ".**"
rclone sync $FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uv --progress --exclude ".**"

FOLDER_NAME=Pictures
rclone sync $FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -uv --progress --exclude ".**"
rclone sync $FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -uv --progress --exclude ".**"
rclone sync $FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -uv --progress --exclude ".**"

