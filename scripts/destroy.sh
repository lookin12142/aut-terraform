#!/bin/bash

cd ..

# Inicializar Terraform
echo "Inicializando Terraform..."
terraform init

# Verificar si terraform init fue exitoso
if [ $? -ne 0 ]; then
  echo "terraform init falló. Abortando."
  exit 1
fi

# Destruir los recursos de Terraform
echo "Destruyendo recursos de Terraform..."
terraform destroy -auto-approve

# Verificar si terraform destroy fue exitoso
if [ $? -ne 0 ]; then
  echo "terraform destroy falló. Revisar errores."
  exit 1
fi

echo "Todos los recursos de Terraform fueron destruidos con éxito!"
