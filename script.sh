#!/bin/bash

SCRIPT_DIR="scripts"

SCRIPTS=("install.sh" "terraform.sh" "kube.sh")

for script in "${SCRIPTS[@]}"; do
  SCRIPT_PATH="$SCRIPT_DIR/$script"
  
  if [ -f "$SCRIPT_PATH" ]; then
    echo "Otorgando permisos de ejecución a $script..."
    chmod +x "$SCRIPT_PATH"
    
    echo "Ejecutando $script..."
    "$SCRIPT_PATH"
    
    if [ $? -ne 0 ]; then
      echo "Error al ejecutar $script. Abortando."
      exit 1
    fi
  else
    echo "El archivo $script no existe en la carpeta $SCRIPT_DIR. Abortando."
    exit 1
  fi
done

echo "Todos los scripts se ejecutaron correctamente."
