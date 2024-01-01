set -e

helm repo add argo https://argoproj.github.io/argo-helm

helm repo update

kubectl apply -f namespace.yaml

echo "Installing Argo CD..."
helm install argo-cd argo/argo-cd --version 5.51.4 --namespace argo-cd -f values.yaml
