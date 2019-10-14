#!/bin/sh

#Este script pretende mostrar el espacio usado por cada usuario y su numero de archivos.

echo "Usuario\tTam. Ocupado\tNum. Ficheros"


for dir in /root/*/     # lista lso directorios en la forma "/tmp/dirname/"
do
	tam="$(du -hs $dir | cut -f1)" #Me quedo solo con el primer campo, el tamano.
	numFich="$(find $dir -type f | wc -l)"
	dir=${dir%*/}      # Elimino la barra "/"
	echo "${dir##*/}\t$tam\t$numFich"
	#En el echo de dir, no me interesa mostrar el directorio, solo la ultima carpeta que se corresponde con el usuario.
	#Es por eso que mediante ese comando me quedo con lo que va despues de la ultima barra
done
