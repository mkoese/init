#!/bin/bash

#export RCLONE_CONFIG_PASS='changeit'
rclone sync dropbox-sealed:/Sealed/ Secrets/ -uv --progress --exclude ".**"

FOLDER_NAME=Documents
rclone sync dropbox:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uv --progress --exclude ".**"

FOLDER_NAME=Pictures
rclone sync dropbox:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -uv --progress --exclude ".**"

