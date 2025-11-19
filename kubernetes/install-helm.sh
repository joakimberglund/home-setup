#!/bin/sh

cd
mkdir -p ~/.kube
k3s kubectl config view --raw > /root/.kube/config
chmod 600 /root/.kube/config
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash -s -
helm version
