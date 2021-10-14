#!/bin/bash

#Cuenta las lineas vacias que tiene un fichero.

echo "Introduzca un directorio:"
read directorio

echo "Introduzca un archivo:"
read archivo

default=$pwd #Para volver despues

if [ -d "$directorio" ]; then
	cd $directorio

	if [ ! -f "$archivo" ]; then
		echo "el archivo $archivo no se existe en esa localizacion."
	else
		numero=$(grep -cvP '\S' $archivo)
		echo "El archivo $archivo tiene $numero lineas blancas."
	fi
else
	echo "el directorio no existe. Introduzca una ubicacion valida."
fi

cd $default
