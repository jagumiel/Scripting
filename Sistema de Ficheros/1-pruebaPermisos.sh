#!/bin/sh
# Voy a probar el funcionamiento de umask con un fichero:
echo "Copruebo mi mascara de usuario".
umask
echo "Creo el archivo file1.test."
touch file1.test
echo "Compruebo exista y muestro sus permiso."
echo $(ls -l | grep file1)
echo "Elimino el archivo, modifico mi mascara y repito el proceso anterior."
rm file1.test
umask 0644
echo "Creo el archivo file1.test."
touch file1.test
echo "Compruebo exista y muestro sus permiso."
echo $(ls -l | grep file1)
echo "¿Ha cambiado el fichero de permisos?."
#Restauro la mascara de usuario a la de defecto
umask 0022
rm file1.test

