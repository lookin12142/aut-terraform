#!/bin/bash

# Variables de versión
TERRAFORM_VERSION="1.4.6"
KUBECTL_VERSION="v1.23.0"

# Instalar Terraform
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_darwin_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_darwin_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v

# Instalar kubectl
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/darwin/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
