#!/bin/bash
microk8s.kubectl -n kubernetes-dashboard describe secret $(microk8s.kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
