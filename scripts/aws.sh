#!/bin/bash

# Definir credenciales y configuración
AWS_ACCESS_KEY_ID="your_access_key_id"
AWS_SECRET_ACCESS_KEY="your_secret_access_key"
AWS_REGION="us-east-1"

# Verificar que AWS CLI esté instalado
if ! command -v aws &> /dev/null
then
    echo "AWS CLI no encontrado. Por favor, instala AWS CLI antes de continuar."
    exit 1
fi

# Configurar AWS CLI utilizando comandos set
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_REGION

echo "AWS CLI configurado con éxito."
