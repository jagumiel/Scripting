#ª/bin/sh
#Script para comprobar lo que ocupan los ficheros mp3 en /home

find /home -type f -name '*.mp3' -exec du -ch {} +

#Se requiere mas de una invocacion a du, pero se va sumando para hallar el total.
