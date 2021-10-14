#!/bin/sh
# Imprime el usuario con el identificador más alto.
awk -F: '{if ($3 >= 100) { print $1 ":" $3 } }' /etc/passwd | head -1