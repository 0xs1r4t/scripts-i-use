#!/bin/bash

# initialize the passwd
pass init $GPG_KEY

# check the passwd store
pass
pass ls

# add your passwd to the store
pass insert $KEYNAME
# can be the name of the website or service

# view password store
cd ~/.password-store
vim $KEYNAME.gpg

# view key
pass $KEYNAME.gpg
