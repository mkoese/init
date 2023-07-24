#!/bin/bash

FOLDER_NAME=Secrets
echo "Write Secrets"
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**"

FOLDER_NAME=Documents
echo "Write ${FOLDER_NAME}"
tar --mac-metadata -cvpf ~/Documents/Preferences/Alfred.tar.xz ~/Documents/Preferences/Alfred.alfredpreferences/
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**" --exclude "*.alfredpreferences/"

FOLDER_NAME=Pictures
echo "Write ${FOLDER_NAME}"
rsync ~/$FOLDER_NAME/ /mnt/usb-sealed/$FOLDER_NAME/ -avP --exclude ".**"
