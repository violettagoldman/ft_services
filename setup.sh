#!/bin/bash
if [[ "$1" == "clean" ]];
then
	kubectl delete --all deployments
	kubectl delete --all pods
	kubectl delete --all services
#A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources.
	kubectl delete --all pvc
else
	#Change defautl driver to a docker one
	minikube start --driver=virtualbox
	#Link local docker to vm docker
	#not restart chaque fois !!!!!!!!!!!!!!!!!!!!!!!!
	eval $(minikube docker-env)
	#setup metallb
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	kubectl apply -f srcs/metallb.yml
# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	#Build nginx
	docker build srcs/nginx/. -t nginx
	docker build srcs/ftps/. -t ftps
	#Create pod and service
	kubectl create -f srcs/nginx.yml
	kubectl create -f srcs/ftps.yml
	#launch dashboard
	minikube dashboard &
fi
