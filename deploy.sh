docker build -t brunokarpo/multi-client:latest -t brunokarpo/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t brunokarpo/multi-server:latest -t brunokarpo/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t brunokarpo/multi-worker:latest -t brunokarpo/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push brunokarpo/multi-client:latest
docker push brunokarpo/multi-server:latest
docker push brunokarpo/multi-worker:latest

docker push brunokarpo/multi-client:$SHA
docker push brunokarpo/multi-server:$SHA
docker push brunokarpo/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=brunokarpo/multi-server:$SHA
kubectl set image deployments/client-deployment client=brunokarpo/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=brunokarpo/multi-worker:$SHA