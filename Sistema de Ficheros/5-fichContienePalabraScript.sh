#!/bin/sh
#Este fichero busca de forma recursiva por debajo de la ruta especificada
#los ficheros que en su interior contengan escrita la palabra "script"

grep -rnw '/home' -e 'script'
