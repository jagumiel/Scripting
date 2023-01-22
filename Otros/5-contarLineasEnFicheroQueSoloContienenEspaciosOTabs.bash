#!/bin/bash

# Comprobar que se haya pasado un fichero como argumento.
if [ $# -eq 0 ]; then
  echo "Error: No se ha introducido un fichero como argumento."
  exit 1
fi

# Asignar el argumento a la variable file.
file=$1

# Inicializar el contador.
counter=0

# Iterar sobre cada línea del documento.
while read line; do
  # Comprobar si la línea contiene exclusivamente espacios o tabuladores.
  if [[ "$line" =~ ^[ \t]*$ ]]; then
    # Incrementar el contador.
    counter=$((counter+1))
  fi
done < "$file"

# Imprimir el resultado.
echo "El fichero tiene $counter lineas que sólo contienen espacios o tabuladores.\n"
