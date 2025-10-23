# Installation

Run as root, yes I know....

This prepair the environment and installs helm
```
sudo bash
apt -y install git
export KUBECONFIG=/root/.kube/config
mkdir ~/.kube 2> /dev/null
k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"
echo "KUBECONFIG=$KUBECONFIG" >> /etc/environment
cd
mkdir helm
cd helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
```
