#!/bin/sh

#Encontrar ficheros dentro de un directorio y hacia abajo en el arbol que sean mayores que el tamanio especificado.
#Param. 1: Directorio
#Param. 1: Tamanio
#El segundo arametro no es obligatorio. Si no existe, por defecto 1MB.

#Se supone que no se debe usar el comando find. Pero seria este comando:
#find . -type f -size +1M
#Si lo queremos hacer con ls, seria de este modo:
#ls -lR | egrep -v '^d' | awk '$5>1000000{print}'
#ls -lR lista de manera recursiva
#egrep -v '^d' solo imprime las lineas que empiecen con la letra d, de directorio.
#awk imprime solo donde la quinta columna es mayor que 1000000Bytes, 1MB.

##########EMPEZAMOS EL SCRIPT#################
tamanio=1000000
if [ $# -eq 0 ]; then #Si no hay argumentos...
	echo "No hay parametros. Introduzca ruta y tamanio maximo."
	exit 1
elif [ $# -ge 1 ]; then #Si hay mas de un argumento, compruebo si existe el directorio
	if [ ! -d "$1" ]; then
		echo "El directorio introducido no existe."
		exit 1
	fi
	if [ $# -eq 2 ]; then #Si hay dos argumentos, compruebo que el segundo sea un numero
		if ! [ "$2" -ge 0 ]; then
			echo "El tamanio introducido es incorrecto." >&2
			exit 1
		else
			tamanio=$2
		fi
	fi
else
	exit 1
fi

ls $1 -lR | egrep -v '^d' | awk '$5>'$tamanio'{print}'
