# K8S WORKER NODE 1 SETUP


#
# SETUP HOSTNAME
sudo hostnamectl set-hostname k8s-worker1

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
# JOIN WORKER NODES TO CONTROL PLANE USING TOKEN

# paste output of kubeadm token create --print-join-command
# sudo kubeadm join ...
