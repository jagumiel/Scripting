#ª/bin/sh

#Este script muestra los ficheros que no son modificables por el propietario.
#Actua sobre el directorio en el que se encuentre el fichero.
#Si se desea cambiar esto, quitar el punto e introducir la ruta.
#Se contempla el caso de los permisos, pero no que el archivo tenga el atributo de "inmutable"

find . -not -perm /u+w
