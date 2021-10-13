#!/bin/bash
# Selector de mascara

PS3='¿Que mascara quieres? '
Opcions=("Opcion 1" "Opcion 2" "Opcion 3" "Quit")
select opt in "${Opcions[@]}"
do
    case $opt in
        "Opcion 1")
            echo "umask 0000: Todos pueden hacer de todo con los nuevos ficheros que crees.";
            umask 0000
            ;;
        "Opcion 2")
            echo "umask 0027: Tendrás poderes sobre tus ficheros, y solo los del grupo pueden leerlos o ejecutarlos. ";
            umask 0027
            ;;
        "Opcion 3")
            echo "umask 0077: Sólo tú tendrás poder sobre tus ficheros. Los demás no pueden ni leerlos.";
            umask 0077
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid Opcion $REPLY";;
    esac
done
