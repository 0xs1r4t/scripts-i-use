# to read, create, delete or modify kubernetes objects

# SERVICES
# a simple way to build microservices within kubernetes

kubectl get service # read all services on control plane

vim my-service.yml
kubectl create -f my-service.yml --save-config # create service from file

kubectl get service my-service # fetch a service

kubectl describe service my-service # describe a service in detail

vim my-service.yml # modify file
kubectl apply -f my-service.yml # apply modifications to service

kubectl delete service my-service

# PODS
# used to run and manage containers

kubectl get nodes

kubectl describe nodes worker-node2

kubectl get pods

kubectl get pod web-frontend

kubectl delete pod web-frontend

vim web-frontend.yml
kubectl create -f web-frontend.yml --save-config

kubectl get pods -o wide # get more info about all pods

kubectl logs web-frontend # get logs about this pod