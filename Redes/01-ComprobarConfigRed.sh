#!/bin/bash

# Declaración de variables para almacenar la información sobre la configuración.
IP_ADDRESS=""
NETMASK=""
GATEWAY=""
DNS=""
CONNECTION_TYPE=""

# Comprobar si el sistema utiliza una configuración IP estática o dinámica.
if grep -q "static" /etc/network/interfaces; then
  CONNECTION_TYPE="Static"
  IP_ADDRESS=$(grep "address" /etc/network/interfaces | awk '{print $2}')
  NETMASK=$(grep "netmask" /etc/network/interfaces | awk '{print $2}')
  GATEWAY=$(grep "gateway" /etc/network/interfaces | awk '{print $2}')
else
  CONNECTION_TYPE="Dynamic (DHCP)"
  IP_ADDRESS=$(ifconfig | grep "inet " | awk '{print $2}')
  NETMASK=$(ifconfig | grep "inet " | awk '{print $4}')
  GATEWAY=$(route -n | grep "UG" | awk '{print $2}')
fi

# Obtener el nombre de los servidores.
DNS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')

# Imprimir la información de la configuración de red.
echo "Dirección IP: $IP_ADDRESS"
echo "Máscara de Red: $NETMASK"
echo "Puerta de Enlace: $GATEWAY"
echo "DNS: $DNS"
echo "Tipo de Conexión: $CONNECTION_TYPE"
