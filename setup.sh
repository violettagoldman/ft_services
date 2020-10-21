#!/bin/bash
OS="`uname`"
if [[ $OS == "Linux" ]];
then
	open="xdg-open"
else
	open="open"
fi

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
	kubectl apply -f srcs/yml/metallb.yml
# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	#Build nginx
	docker build srcs/nginx/. -t nginx
	docker build srcs/ftps/. -t ftps
	docker build srcs/mysql/. -t mysql
	docker build srcs/wordpress/. -t wordpress
	docker build srcs/phpmyadmin/. -t phpmyadmin
	docker build srcs/influxdb/. -t influxdb
	#Create pod and service
	kubectl create -f srcs/nginx/nginx.yml
	kubectl create -f srcs/ftps/ftps.yml
	kubectl create -f srcs/mysql/mysql.yml
	kubectl create -f srcs/wordpress/wordpress.yml
	kubectl create -f srcs/phpmyadmin/phpmyadmin.yml
	kubectl create -f srcs/influxdb/influxdb.yml
	#launch dashboard
	minikube dashboard &
	$open https://$(kubectl describe services | grep Ingress |  cut -d ":" -f 2 | uniq | tr -s ' ' '\0')
fi
