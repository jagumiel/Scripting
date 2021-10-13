#!/bin/sh

# Queremos obtener la lista de los procesos (PIDs) de usuario que tienen un tiempo de CPU superior a 120 segundos (00:02:00). Por cada proceso detectado, debemos añadir su PID UID PCPU TCPU y CMD en el fichero /var/log/Lista-procesos-ExcesoCPU.txt.

if [ $(id -u) -ne 0 ]; then
    echo 'Ejecute como superusuario'  # requerido pues se intenta escribir en /var/log/
    exit 1
fi

logfile='/var/log/listaProcesosExcesoCpu.txt'
echo "pid\tuid\tpcpu\tcmd\ttime" > logfile
ps -eo pid,uid,pcpu,cmd,time | tail -n +2 |
    while read line; do
        time=$(echo $line | rev | cut -d ' ' -f1 | rev)
        mm=$(echo $time | cut -d ':' -f2)
        if [ $mm -ge 2 ]; then
            echo $line
            echo $line >> $logfile
            echo ""
        fi
    done

echo "Registro salvado en $logfile"
# ESTO ES ORO, asi se separa una cadena en donde no se saben cuantos campos
# sentence='12:32:48'
# IFS=':'
# for x in $sentence; do
#     echo $x
# done

