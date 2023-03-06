#!/bin/bash

# Comprobar la velocidad y la ruta de comunicación con un servidor remoto

# Establecer direcciones remotas
remote_addr1="www.elhuyar.com"
remote_addr2="www.ehu.es"

# Comprobar si el comando esta instalado
if ! command -v traceroute &> /dev/null
then
    echo "No se ha encontrado el comando traceroute. Por favor, instálelo primero."
    exit
fi

# Función para comprobar traceroute para una dirección dada
check_traceroute () {
    echo "Traceroute for $1:"
    traceroute -m 20 $1
    echo ""
}

# Comprobar traceroute para ambas direcciones remotas
check_traceroute $remote_addr1
check_traceroute $remote_addr2

