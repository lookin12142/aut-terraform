#!/bin/bash

# Variables de versión

EKS_REGION="us-east-1"
EKS_CLUSTER_NAME="pepito"

# Variables de configuración de EKS
aws eks --region $EKS_REGION update-kubeconfig --name $EKS_CLUSTER_NAME
# Definir el directorio de los archivos de despliegue
DEPLOY_DIR="../deployments"

# Array de archivos de configuración en el directorio de despliegue
resources=(
  "client-deployment.yaml"
  "client-service.yaml"
  "extractor-worker-deployment.yaml"
  "extractor-worker-service.yaml"
  "gateway-deployment.yaml"
  "gateway-service.yaml"
  "kafka-worker-deployment.yaml"
  "kafka-worker-service.yaml"
  "recommender-deployment.yaml"
  "recommender-service.yaml"
  "spark-deployment.yaml"
  "spark-service.yaml"
)

# Aplicar cada recurso con kubectl desde el directorio de despliegue
for resource in "${resources[@]}"; do
  echo "Aplicando $resource..."
  kubectl apply -f "$DEPLOY_DIR/$resource"
  if [ $? -ne 0 ]; then
    echo "Error al aplicar $resource. Abortando."
    exit 1
  fi
done

echo "Todos los recursos se aplicaron correctamente."
