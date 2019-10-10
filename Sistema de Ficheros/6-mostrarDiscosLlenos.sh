#!/bin/sh

#Este script muestra los volumenes que estan por encima del 85% de capacidad.
ocupacion=85
df -h | awk '$5>'$ocupacion'{print}'
