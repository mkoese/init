#!/bin/bash

FOLDER_NAME=Secrets
echo "Write Secrets"
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**"

FOLDER_NAME=Documents
echo "Upload ${FOLDER_NAME}"
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**" --exclude "*.alfredpreferences/"
tar -xJvpf ~/Documents/Preferences/Alfred.tar.xz -C ~/Documents/Preferences/

FOLDER_NAME=Pictures
echo "Upload ${FOLDER_NAME}"
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**"
