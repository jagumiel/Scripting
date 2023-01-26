#!/bin/bash

# Definir el programa a ejecutar y la fecha por la que filtrar
program="last -F"
date_to_filter="2022-01-01"

# Ejecutar el programa y filtrar la salida
output=$($program | awk -v date="$date_to_filter" '{if ($NF > date) print $0}')

# Imprimir la salida filtrada
echo "$output"
