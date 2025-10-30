#!/bin/bash

# Initialisation du master (adapter --pod-network-cidr si besoin pour flannel)
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Config utilisateur local
echo "\nCopie du kubeconfig..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Installer Flannel CNI
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Manifeste infra app
kubectl apply -f db-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f hpa-backend-cpu.yaml
kubectl apply -f hpa-backend-memory.yaml

# Vérif statut
kubectl get nodes
kubectl get all
