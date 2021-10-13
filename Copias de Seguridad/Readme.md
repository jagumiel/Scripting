# Scripts
## _Copias de Seguridad_

En este apartado del repositorio los scripts están relacionados con las copias de seguridad. Se tratan temas como de qué usuarios hacer copias, qué extensiones de archivo omitir y cómo hacer que las copais sean periódicas.


## Enunciados de los scripts

1.	Programa un script que, recibiendo como parámetro un identificador de usuario, genera un archivo comprimido, de nombre _**/backup/yyyy-mm-dd-nombreusuario.tar.gz**_ con el contenido del directorio principal de ese usuario. 
**Notas:**
    - No se puede presuponer que el directorio principal del usuario estará en _/home/nombre-usuario_.
    - _nombreusuario_ varía en función del parámetro recibido.
2.	Modifica el script anterior para no incluya en la copia de seguridad los archivos con extensión _mp3_ y _avi_.
3.	Modifica el script anterior para que lea las extensiones de los archivos de los que no debe hacer copia a través del fichero _blacklist.conf_. Este fichero tiene en cada línea una extensión que no se permite en el backup.
4.	Programa un script que haga una copia de seguridad de todos los usuarios del sistema (utilizando el script del punto anterior).
5.	Programa la ejecución del script anterior para que se ejecute a diario.

