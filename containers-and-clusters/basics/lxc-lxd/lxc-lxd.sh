cat /etc/issues
# use apt/apt-get with ubuntu/debian-based distros

sudo apt-get install lxd lxd-client # installing linux daemon and container clients

# setup environment with daemon
sudo lxd init
# new storage pool - yes
# storage backend - dir
# available over the network - no
# configure lxd bridge - yes

# bridge setup - select all defaults
# no for ipv6

# check if environment is working
sudo lxc list

# launch a container (Ubuntu 16.04)
lxc launch ubuntu:16.04 # image is pulled from container repo
lxc launch ubuntu:16.04 my-ubuntu # image is pulled and renamed as my-ubuntu

lxc list # list of all available images

# launch a remote
# remote - a domain that hosts images for lxc and lxd
# similar to a repository
lxc launch images:alpine/3.5 my-alpine
lxc list # all containers are up and running with networking

# use lxc container image
lxc exec my-ubuntu -- /bin/bash # with bash
whoami # root 
cat /etc/issue # Ubuntu 16.04.05 \n \l
exit

# use alpine
# super small distro
# bash isn't installed so the ash terminal is used instead
lxc exec my-alpine -- /bin/ash
whoami
echo hello > hi.txt
cat hi.txt # hello
exit

# remotes
lxc remote list
# only pull original images (released by ubuntu) from the repository or by a source that you trust



