#!/bin/bash

# Use GitHub Secrets for FTP server details
FTP_SERVER="$FTP_SERVER_SECRET"
FTP_USERNAME="$FTP_USERNAME_SECRET"
FTP_PASSWORD="$FTP_PASSWORD_SECRET"

# Clone the current repository
REPO_NAME=$(basename $(git remote get-url origin) .git)
git clone . "$REPO_NAME"

# Connect to the FTP server and upload all files and folders
lftp -c "open -u $FTP_USERNAME,$FTP_PASSWORD $FTP_SERVER; mirror -R $REPO_NAME"
