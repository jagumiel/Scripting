#!/bin/sh
#Voy a mostrar los archivos que han sido modificados el ultimo dia
#El comando es el siguiente: find / -mtime -1 -ls
#El -1 es importante, significa que se han modificado en el último día o menos, es decir, en las ultimas 24 horas.
#Si pusiera un +1, seria al reves, archivos que llevan mas de un dia sin modificar
#Si no pnemos signo, significa archivos que se han modificado exactamente hace un dia

echo "Imprimiendo los archivos modificados en las ultimas 24h."
echo $(find / -mtime -1 -ls)
