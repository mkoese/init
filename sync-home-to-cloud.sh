#!/bin/bash

OS=$(uname)

cd ~
#export RCLONE_CONFIG_PASS='changeit'
FOLDER_NAME=Secrets
echo "Upload ${FOLDER_NAME}"
rclone copy $FOLDER_NAME/ dropbox-sealed:/Sealed/ -uP --exclude ".**"

echo "Download ${FOLDER_NAME} from Cloud to Local"
rclone sync dropbox-sealed:/Sealed/ $FOLDER_NAME/  -uP --exclude ".**"


if [ "$OS" == "Darwin" ]; then
    echo "Running on macOS"
    cd ~/Documents/Preferences
    tar --mac-metadata -cpJf Alfred.tar.xz Alfred.alfredpreferences/
    cd ~
fi

FOLDER_NAME=Documents
echo "Upload ${FOLDER_NAME}"
rclone copy ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"
rclone copy ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"
rclone copy ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"

echo "Download ${FOLDER_NAME} from Cloud to Local"
rclone sync dropbox:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"
rclone sync onedrive:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"
rclone sync gdrive:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**" --exclude "*.alfredpreferences/"


FOLDER_NAME=Pictures
echo "Upload ${FOLDER_NAME}"
rclone copy ~/$FOLDER_NAME/ dropbox:/$FOLDER_NAME/ -u --exclude ".**"
rclone copy ~/$FOLDER_NAME/ onedrive:/$FOLDER_NAME/ -u --exclude ".**"
rclone copy ~/$FOLDER_NAME/ gdrive:/$FOLDER_NAME/ -u --exclude ".**"

echo "Download ${FOLDER_NAME} from Cloud to Local"
rclone sync dropbox:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**"
rclone sync onedrive:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**"
rclone sync gdrive:/$FOLDER_NAME/ ~/$FOLDER_NAME/ -u --exclude ".**"

echo "Done"
