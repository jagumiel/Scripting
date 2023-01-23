#!/bin/bash

# Comprobar que se haya pasado un fichero como argumento.
if [ $# -eq 0 ]; then
  echo "Error: No se ha introducido un fichero como argumento."
  exit 1
fi

# Asignar el argumento a la variable file.
file=$1

# Crear un fichero temporal
temp_file=$(mktemp)

# Iterar sobre cada línea del documento.
while read line; do
  # Si la linea no contiene exclusicamente espacios ni tabuladores...
  if [[ ! "$line" =~ ^[ \t]*$ ]]; then
    # ... la apuntamos en el temporal.
    echo "$line" >> "$temp_file"
  fi
done < "$file"

# El temporal solo contiene informacion. Se han borrado las lineas. Lo reemplazamos por el original.
mv "$temp_file" "$file"

echo "El fichero $file ha sido modificado, todas las líneas que contenían exclusivamente espacios o tabuladores han sido eliminadas.\n"
