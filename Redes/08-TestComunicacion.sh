#!/bin/bash

# Crear la lista de nodos
nodes=(localhost $(ip route | grep 'src' | awk '{print $9}' | cut -d'.' -f1-3'.0') www.ehu.es www.google.com www.gnu.org)

# Definir el comndo ping
ping_cmd="ping -c 1"

while true; do
    # Recorrer la lista de nodos
    for node in "${nodes[@]}"; do
        # Ejecutar el comando ping y verificar el resultado
        $ping_cmd $node > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "$(date): $node es accesible."
        else
            echo "$(date): $node es inaccesible."
        fi
    done
    # Esperar una hora hasta la proxima ejecucion.
    sleep 3600
done
