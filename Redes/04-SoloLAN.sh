#!/bin/bash

# Definir la dirección IP de la puerta de acceso.
gateway="192.168.1.1"

# Añadir una ruta por defecto a la puerta de enlace, pero con una métrica alta para evitar el acceso externo.
route add default gw "$gateway" metric 100

# Eliminar cualquier ruta por defecto existente con una métrica inferior.
route del default

# Mostrar la tabla de enrutamiento actual
route -n

echo "Configuración de red actualizada. Ahora sólo puede acceder a la red local."
