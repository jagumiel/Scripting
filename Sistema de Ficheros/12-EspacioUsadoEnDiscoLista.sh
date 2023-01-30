#!/bin/bash

# Especificar la ruta del archivo que contiene la lista de directorios.
dir_list_file="/path/to/dir_list.txt"

# Inicializar variable.
total_size=0

# Ciclar a través de la lista de directorios.
while read dir_path; do
    # Usar el comando `du` con el flag `-s` para mostar el espacio de disco total utilizado en un directorio.
    dir_size=$(du -s "$dir_path" | awk '{print $1}')
    # Actualizar la variable sumando el tamaño de cada directorio.
    total_size=$((total_size + dir_size))
done < $dir_list_file

# Imprimir el valor total.
echo "Espacio total en disco ocupado por los elementos almacenados en los directorios: $total_size KB"
