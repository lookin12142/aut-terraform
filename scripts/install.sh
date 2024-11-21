#!/bin/bash

# Variables de versión
TERRAFORM_VERSION="1.9.8"
KUBECTL_VERSION="v1.23.0"
AWS_CLI_VERSION="2.3.5"

# Variables de configuración de EKS
EKS_REGION="us-east-1"
EKS_CLUSTER_NAME="pepito"

# Instalar unzip si no está instalado
if ! command -v unzip &> /dev/null
then
    echo "unzip no encontrado. Instalando unzip..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Instalar Terraform
echo "Descargando Terraform..."
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v

# Instalar kubectl
echo "Descargando kubectl..."
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

# Instalar AWS CLI
echo "Instalando AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

# Configurar kubeconfig para EKS
echo "Configurando kubeconfig para EKS..."
aws eks --region $EKS_REGION update-kubeconfig --name $EKS_CLUSTER_NAME

echo "Instalación y configuración completadas."
