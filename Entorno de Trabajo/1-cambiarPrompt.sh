#!/bin/sh
# Voy a cambiar la salida del prompt para que muestre "user@path" en la linea de comandos.
echo 'export PS1="\u\w "'>> ~/.bashrc
