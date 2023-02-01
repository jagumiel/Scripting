#!/bin/bash

# Obtener la configuración actual de la dirección IP.
ip_config=$(ip addr show | grep 'inet ' | awk '{print $2}')

# Comprobar si la dirección IP está actualmente asignada dinámicamente.
if echo "$ip_config" | grep -q "dynamic"; then
  # Obtener la dirección IP, máscara de red y puerta de enlace actuales.
  current_ip=$(echo "$ip_config" | awk 'NR==1{print $1}' | cut -d/ -f1)
  current_mask=$(echo "$ip_config" | awk 'NR==1{print $1}' | cut -d/ -f2)
  current_gw=$(ip route | grep default | awk '{print $3}')

  # Solicitar la nueva dirección IP estática, máscara de red y puerta de enlace.
  echo "Introduzca la IP estática: "
  read static_ip
  echo "Introduzca la máscara de red estática (por ejemplo, 24): "
  read static_mask
  echo "Introduzca la puerta de enlace estática: "
  read static_gw

  # Configurar la dirección IP estática.
  sudo ip addr flush dev $(ip route | awk '/^default/ { print $5 }')
  sudo ip addr add "$static_ip"/"$static_mask" dev $(ip route | awk '/^default/ { print $5 }')
  sudo ip route add default via "$static_gw"

  # Confirmar el cambio.
  echo "Dirección IP cambiada con éxito a estática..."
  echo "Nueva IP: $static_ip"
  echo "Máscara de Red: $static_mask"
  echo "Puerta de Enlace: $static_gw"
else
  # Obtener la dirección IP estática actual, la máscara de red y la puerta de enlace.
  current_ip=$(echo "$ip_config" | awk 'NR==1{print $1}' | cut -d/ -f1)
  current_mask=$(echo "$ip_config" | awk 'NR==1{print $1}' | cut -d/ -f2)
  current_gw=$(ip route | grep default | awk '{print $3}')

  # Cambiar a dirección IP dinámica.
  sudo ip addr flush dev $(ip route | awk '/^default/ { print $5 }')
  sudo dhclient $(ip route | awk '/^default/ { print $5 }')

  # Confirmar el cambio.
  echo "Dirección IP cambiada con éxito a dinámica..."
  echo "Nueva IP: $(ip addr show | grep 'inet ' | awk 'NR==2{print $2}')"
fi
