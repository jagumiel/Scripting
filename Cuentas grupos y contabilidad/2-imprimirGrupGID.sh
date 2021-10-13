#!/bin/sh

# Crea un script que dado un nombre de grupo como argumento, escriba en la
# salida estándar el código del grupo (GID) que le corresponde.

if [ $# -ne 1 ]; then
    echo 'Introduzca el nombre del grupo.'
    exit 1
fi

groupname=$1
gid=$(grep $groupname /etc/group | cut -d ':' -f3)
echo $gid

exit 0

