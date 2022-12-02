#!/bin/bash

# create a key
gpg --full-generate-key

# print out key in long format
gpg --list-secret-key --keyid-format LONG

# remove a key
gpg --delete-secret-and-public-key $KEY_NAME

# decrypt key
gpg -d $KEY_FILE
# gpg -d <key>.gpg
