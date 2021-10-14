#!/bin/sh
# Imprime la lista de usuarios con un identificador mayor que 100.
awk -F: '{if ($3 >= 100) { print $1 ":" $3 } }' /etc/passwd