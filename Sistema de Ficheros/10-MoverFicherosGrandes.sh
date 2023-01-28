#!/bin/bash

# Especificar el directorio donde se quiere buscar los archivos.
search_dir="/path/to/search"

# Especificar dónde se quieren mover los archivos, es decir, la carpeta de backup.
backup_dir="/path/to/backup"

# Especificar el umbral máximo permitido del fichero (en MB)
threshold=500

# Encontrar esos archivos y moverlos a la carpeta de backup.
find $search_dir -type f -size +${threshold}M -exec mv {} $backup_dir \;

# Registrar la acción al fichero correspondiente.
echo "$(date): Moved files larger than $threshold MB from $search_dir to $backup_dir" >> /var/log/user-storage-iMxseeHB.log
