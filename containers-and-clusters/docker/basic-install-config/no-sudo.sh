# add user to "docker" group
# so that user doesn't have to use sudo to run docker
# where $USER is the username of the user to be added

sudo usermod -a -G docker $USER

# -a : append user (to be used with -G)
# -G : name of group(s) following this
# are the group(s) the user is to be added to
