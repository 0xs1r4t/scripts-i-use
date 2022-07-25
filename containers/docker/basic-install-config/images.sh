docker image pull alpine:latest # tiny and quick to pull
docker history alpine
docker images

# default image has the "latest" tag so specifying it isn't a necessity
docker image pull httpd
docker images
docker history httpd # has more image layers
docker history httpd --no-trunc
# best to see images in docker hub and/or github since it's super user-friendly!
