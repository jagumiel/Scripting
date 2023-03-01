#!/bin/bash

echo "Informe de la Configuracion de Red"
echo "----------------------------------"

# Muestra información de las interfaces
echo "Información de las interfaces:"
ifconfig -a

# Muestra la tabla de encaminamiento
echo ""
echo "Tabla de Encaminamiento:"
route -n

# Muestra los puertos abiertos
echo ""
echo "Puertos Abiertos:"
netstat -tuln

# Muestra los procesos que están escuchando los puertos
echo ""
echo "Procesos escuchando en puertos:"
lsof -i