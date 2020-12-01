# Django_with_k8s
To start the Kubernetes cluster with a specific version using minikube, run the command:
$ minikube start --kubernetes-version=v1.19.2
Setting the default kubectl context to minikube i.e. kubectl config use-context minikube

The status of the minikube cluster can be determined by running:
$ minikube statushost: Running
kubelet: Running
apiserver: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.100
And to confirm the kubectl context, the command is:
$ kubectl config current-context
minikube


The docker command line in the host machine can be configured to utilize the docker daemon within minikube by running:
$ eval $(minikube docker-env)

To confirm:
$ docker info | grep Name
Name: minikube
ehsan@ehsan-desktop:~/django_with_k8s$ cat Dockerfile 
FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
CMD python manage.py runserver 0.0.0.0:8000
docker build -t k8_django_minikube:1.0 .
kubectl run kubernetes-django --image=k8_django_minikube –port=8000
