#!/bin/bash

# Tiene el usuario permisos de root?
if [[ $EUID -ne 0 ]]; then
   echo "Este script tiene que ejecutarse como root" 
   exit 1
fi

# Usamos grep para busar en /etc/shadow lineas que no cumplan la expresion regular.
# '^[^:]*::', que identifica las lineas que no tienen dos simbolos consecutivos (":") el el segundo campo
grep -vE '^[^:]*::' /etc/shadow
