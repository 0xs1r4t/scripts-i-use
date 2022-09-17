# K8S CONTROL PLANE SETUP


#
# SETUP HOSTNAME
sudo hostnamectl set-hostname k8s-control

sudo vi /etc/hosts
###########################################
<control plane node private IP> k8s-control
<worker node 1 private IP> k8s-worker1
<worker node 2 private IP> k8s-worker2
###########################################

#
# CONFIGURATION AND INSTALLATION
cat << EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

sudo swapoff -a

sudo apt-get update && sudo apt-get install -y apt-transport-https curl

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update && sudo apt-get install -y kubelet=1.24.0-00 kubeadm=1.24.0-00 kubectl=1.24.0-00

sudo apt-mark hold kubelet kubeadm kubectl

#
# CONTROL PLANE ONLY
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.24.0

# can be copied from output of above cmd
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

#
# APPLY NETWORK ADD-ON

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

#
# JOIN WORKER NODES TO CONTROL PLANE USING TOKEN

kubeadm token create --print-join-command
# copy output and then paste + run on worker nodes
# sudo kubeadm join ...

kubectl get nodes
# wait till all nodes have the Ready status
