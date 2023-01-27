#!/bin/bash

# Mirar qué usuarios no han modificado su contraseña.
users=$(awk -F: '$3 == "1000" {print $1}' /etc/passwd)

# Establecer contraseña como expirada.
for user in $users; do
  chage -d 0 $user
  echo "La contraseña para el usuario $user se ha establecido como expirada."
done
