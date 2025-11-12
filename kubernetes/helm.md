# Installation

Run as root, yes I know....

This prepair the environment and installs helm
```
sudo bash
apt -y install git
mkdir -p ~/.kube
k3s kubectl config view --raw > /root/.kube/config
chmod 600 /root/.kube/config
cd
mkdir helm
cd helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
helm version
```
