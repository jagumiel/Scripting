#!/bin/bash

# Especificar el directorio donde comprobar el uso de espacio de disco.
dir_path="/path/to/check"

# Utilizar el comando `du` con el flag`-s` para mostrar el uso total del disco en un directorio.
du -s $dir_path
