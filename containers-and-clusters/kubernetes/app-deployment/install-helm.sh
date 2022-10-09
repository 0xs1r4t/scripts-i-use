# add gpg key
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# check key
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# install helm
sudo apt-get update
sudo apt-get install -y helm

# add a helm repository
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# install a chart in a namespace
helm install -n cert-manager cert-manager bitnami/cert-manager

    # NAME: cert-manager
    # LAST DEPLOYED: Sun Oct  9 17:26:10 2022
    # NAMESPACE: cert-manager
    # STATUS: deployed
    # REVISION: 1
    # TEST SUITE: None
    # NOTES:
    # CHART NAME: cert-manager
    # CHART VERSION: 0.8.5
    # APP VERSION: 1.9.1

# check all installed kube config
kubectl get pods -n cert-manager
kubectl get deployments -n cert-manager
kubectl get svc -n cert-manager