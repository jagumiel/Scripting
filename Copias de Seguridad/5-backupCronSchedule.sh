#!/bin/sh

# Programa la ejecución del script anterior para que se ejecute a diario.

crontab -e
# Agrega la siguiente linea en el fichero crontab
# 0 0 * * * /rutadelscript/4-backupAllUsersWithRules.sh

#Descomentar linea anterios e introducir la ruta verdadera al script para que se ejecute periodicamente.