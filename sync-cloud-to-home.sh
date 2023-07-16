#!/bin/bash

#export RCLONE_CONFIG_PASS='changeit'

rclone copyto dropbox:sync-cloud-to-home.sh sync-cloud-to-home.sh
rclone copyto dropbox:sync-home-to-cloud.sh sync-home-to-cloud.sh

rclone sync dropbox-sealed:/Sealed/ Secrets/ -uv --progress --exclude ".**"

FOLDER_NAME=Documents
rclone sync dropbox:/$FOLDER_NAME/ $FOLDER_NAME/ -uv --progress --exclude ".**"

FOLDER_NAME=Pictures
rclone sync dropbox:/$FOLDER_NAME/ -uv $FOLDER_NAME/ --progress --exclude ".**"

