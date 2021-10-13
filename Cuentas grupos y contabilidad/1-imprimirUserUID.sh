#!/bin/sh

# Crea un script que dado un nombre de usuario como argumento, escriba en la salida estándar el código de usuario (UID) que le corresponde.

if [ $# -lt 1 ]; then
    echo 'Introduzca el nombre del usuario.'
    exit 1
fi

uid=$1
usrname=$(grep $uid /etc/passwd | cut -d ':' -f1)
echo $usrname

exit 0

