# check storage driver
docker info | grep Storage

# setting storage driver

# 1 - not recommended
sudo vim /path/to/docker.service
# /usr/lib/systemd/system/docker.service
# /ExecStart
# set --storage-driver flag
# --storage-driver overlay2
# --storage-driver devicemapper

# ---------------
[Service]
...
ExecStart=/usr/bin/dockerd --storage-driver overlay2 -H fd://
...
# ---------------

# reload daemon
sudo systemctl daemon reload

# restart service
sudo systemctl restart docker

# check again

# 2 - recommended
# set storage-driver in /etc/docker/daemon.json
# file doesn't exist, it has to be created
sudo vim /etc/docker/daemon.json

# add to the file
{
        "storage-driver": "devicemapper"
}

# restart system
sudo systemctl restart docker
docker info | grep Storage
