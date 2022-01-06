#!/usr/bin/env zsh
sudo -k

minikube --node=cluster2     ssh "sudo rm -rf /data/standard-storage/*"
minikube --node=cluster2-m02 ssh "sudo rm -rf /data/standard-storage/*"
minikube --node=cluster2-m03 ssh "sudo rm -rf /data/standard-storage/*"