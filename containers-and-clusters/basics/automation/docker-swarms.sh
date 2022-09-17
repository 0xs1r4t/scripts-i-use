ip a # get public ip of system

# $ADDR=<public_ip>

docker swarm init --advertise-addr $ADDR
# copy "docker swarm join --token $TOKEN_ID $ADDR:$PORT"
# command used to give other systems access to your docker swarm environment
# docker swarm join-token manager

# add on workers 2 and 3
docker swarm join --token $TOKEN_ID $ADDR:$PORT

docker node ls # see on 1st node - 3 active servers
# worker nodes can't be used to view or modify the cluster status

# on original server
docker run -d httpd # detached
docker ps

# on docker swarm
docker service create --replicas 2 -p 80:80 --name myweb nginx
docker service ls
docker service ps myweb # myweb.1, myweb.2

docker ps

# checking whether our environment works or not
# os in CentOS
sudo yum install elinks
elinks $NODE_ADDR:80 # port 80
# check $NODE_ADDR on browser, it should lead to an nginx server
