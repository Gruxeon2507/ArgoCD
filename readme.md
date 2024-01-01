# ArgoCD

This is a Kubernetes-based template that uses ArgoCD for GitOps. The template is structured to support multiple environments, specifically `development` and `production`.

## Project Structure

The project is divided into two main directories: [`argocd`](command:_github.copilot.openRelativePath?%5B%22argocd%22%5D "argocd") and [`k8s`](command:_github.copilot.openRelativePath?%5B%22k8s%22%5D "k8s").

### argocd

This directory contains the ArgoCD ApplicationSet definitions for `development` and `production` environments. These files are located in [`argocd/development/base.yaml`](command:_github.copilot.openRelativePath?%5B%22argocd%2Fdevelopment%2Fbase.yaml%22%5D "argocd/development/base.yaml") and [`argocd/production/base.yaml`](command:_github.copilot.openRelativePath?%5B%22argocd%2Fproduction%2Fbase.yaml%22%5D "argocd/production/base.yaml") respectively.

### k8s

This directory contains the Kubernetes resources for the application. It is further divided into `base`, `chart`, and `env`.

- `base`: Contains the base Kubernetes resources for the application, including the Deployment and Service definitions. These are defined in [`k8s/base/deployment.yaml`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fbase%2Fdeployment.yaml%22%5D "k8s/base/deployment.yaml") and [`k8s/base/services.yaml`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fbase%2Fservices.yaml%22%5D "k8s/base/services.yaml") respectively.

- `chart`: Contains the Helm chart for ArgoCD, including the installation script, namespace definition, and values file. These are located in [`k8s/chart/argo-cd/install.sh`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fchart%2Fargo-cd%2Finstall.sh%22%5D "k8s/chart/argo-cd/install.sh"), [`k8s/chart/argo-cd/namespace.yaml`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fchart%2Fargo-cd%2Fnamespace.yaml%22%5D "k8s/chart/argo-cd/namespace.yaml"), and [`k8s/chart/argo-cd/values.yaml`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fchart%2Fargo-cd%2Fvalues.yaml%22%5D "k8s/chart/argo-cd/values.yaml") respectively.

- `env`: Contains environment-specific Kubernetes resources for `development` and `production`. Each environment has its own ConfigMap, IngressRoute, Kustomization, and Namespace definitions.

## Getting Started

To get started with this project, you will need to have Kubernetes and ArgoCD installed and configured.

1. Install ArgoCD using the script in [`k8s/chart/argo-cd/install.sh`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fchart%2Fargo-cd%2Finstall.sh%22%5D "k8s/chart/argo-cd/install.sh").

```sh
./k8s/chart/argo-cd/install.sh
```

2. Apply the ArgoCD ApplicationSet for the desired environment. For example, for the `development` environment:

```sh
kubectl apply -f argocd/development/base.yaml
```

3. ArgoCD will automatically sync the Kubernetes resources defined in the [`k8s/env/development`](command:_github.copilot.openRelativePath?%5B%22k8s%2Fenv%2Fdevelopment%22%5D "k8s/env/development") directory.

Please replace `development` with `production` for production environment.
