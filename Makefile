# Apply all files on k8s directory
dev-kubernetes-apply:
	- kubectl apply -f ./k8s

dev-kubernetes-delete:
	- kubectl delete -f ./k8s