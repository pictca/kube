#!/bin/bash
microk8s.kubectl create -f namespace.json
microk8s.kubectl apply -f dashboard-adminuser.yaml
microk8s.kubectl apply -f clustter.yaml
microk8s.enable dashboard rbac storage
microk8s.kubectl -n kubernetes-dashboard describe secret $(microk8s.kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') > out
# run http port
microk8s.kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
