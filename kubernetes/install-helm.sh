#!/bin/sh

cd
apt -y install git
mkdir -p ~/.kube
k3s kubectl config view --raw > /root/.kube/config
chmod 600 /root/.kube/config
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh -s -
#curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
#chmod 700 get_helm.sh
#./get_helm.sh
#rm get_helm.sh
helm version
