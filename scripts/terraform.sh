#!/bin/bash

# Inicializar Terraform
echo "Inicializando Terraform..."
terraform init

# Verificar si terraform init fue exitoso
if [ $? -ne 0 ]; then
  echo "terraform init falló. Abortando."
  exit 1
fi

# Crear el plan de Terraform
echo "Creando plan de Terraform..."
terraform plan -out=tfplan

# Verificar si terraform plan fue exitoso
if [ $? -ne 0 ]; then
  echo "terraform plan falló. Abortando."
  exit 1
fi

# Aplicar el plan de Terraform
echo "Aplicando plan de Terraform..."
terraform apply -auto-approve tfplan

# Verificar si terraform apply fue exitoso
if [ $? -ne 0 ]; then
  echo "terraform apply falló. Revisar errores."
  exit 1
fi

echo "Terraform aplicado con éxito!"
