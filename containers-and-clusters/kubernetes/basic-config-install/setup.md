# Setup + Installation + Configuration

## General Server Setup

Create one server for the control plane, and one server each for the worker nodes (2 worker nodes = 2 servers, 3 worker nodes = 3 servers ...)

A super simple server config should include the following
1. Distribution = Ubuntu 20.04 Focal Fossa LTS
2. Size = Medium (not in free tier of AWS)
3. Cloud Service = Any (I prefer [AWS](https://aws.amazon.com/))

Other sources
1. [Installing `kubeadm`](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
2. [Creating a cluster with `kubeadm`](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)

## Control Plane

Follow `k8s-control-plane.sh`

## Worker Nodes

Follow `k8s-worker-node1.sh` and use varying names for the hosts (eg: k8s-worker1, k8s-worker2, k8s-worker3, ...)

## Error Resolution

I'm not sure why I kept an error regarding IPv4 forwarding being denied, but I was able to resolve it by adding a rule to the `sysctl.conf` file. I've added the solution here too. 

See `ipv4-err.sh.log` for more information.

[Source](https://askubuntu.com/questions/783017/bash-proc-sys-net-ipv4-ip-forward-permission-denied)
