# Scripts
## _Sistema de Ficheros_

En este apartado del repositorio se encuentran aquellos scripts que trabajan sobre el sistema de ficheros. Son aquellos que buscan conocer el espacio de disco duro usado, la proporción del tamaño usado por cada usuario, encontrar los archivos grandes o de extensiones determinadas... Algunos de ellos pueden incluso ser tareas rutinarias que usan cada día los administradores de sistemas.


## Enunciados de los scripts


1.	Crea un fichero y cámbiale los permisos. Cambia los permisos por defecto usando umask (compruébalo creando un nuevo fichero).
2.	Lista los ficheros que no puede modificar el propietario.
3.	Busca a través del sistema de ficheros completo los ficheros modificados el ultimo día.
4.	Consultando el apartado de scripting, programa un script que liste los ficheros grandes por debajo de un directorio pasado como parámetro fijo se debe utilizar el comando find. Se considera fichero grande el que ocupe más Ks que las especificadas en el segundo parámetro. Si no existe un segundo parámetro, se tomará el valor de 1MB.
5.	Busca en tu cuenta los ficheros que en la parte de datos contienen la palabra 'script’.
6.	Programa un script que examine las unidades montadas y muestre un listado con las unidades que tengan libre menos de un 15% del espacio total.
7.	Programa otro script que muestre el tamaño ocupado por cada subdlrectorio en el directorio /home.
Hacer lo mismo, pero sólo teniendo en cuenta los ficheros de tipo mp3.
8.	En una máquina que administramos tenemos instalado un disco que almacena el contenido del directorio /users, directorio donde los usuarios tienen almacenados sus datos personales. Cada usuario dispone de un subdirectorio (con su nombre) en /users, y se ha configurado el servidor con un sistema de cuotas por cada usuario. Tras un periodo de funcionamiento se observa que el disco se encuentra a más de un 80% de utilización. Se decide realizar un análisis de la cantidad de información que utilizan los usuarios para estudiar la necesidad de ampliación del espacio de almacenamiento de los dispositivos.
Nos interesa conocer, por cada usuario, el espacio de almacenamiento total y el número de ficheros contenido en su directorio. Crea un script, de nombre /root/script-users.sh, que nos genere un resumen con esa información en el siguiente formato:
    ```
    #User      TotaL-size      File-Number
    userl	    400000	            45
    user2	    5982	            32
    ...
    ```

9.	Utilizando el script del apartado anterior, proqrama el script /root/script-user$-eaRer$.sh que obtiene un listado de aquellos usuarios que sobrepasan un espacio total de almacenamiento mayor que un argumento del script (el argumento en la posición 1).
El listado debe ser guardado en el fichero /var/iog/user-storage.iog. Adicionalmente, por cada usuario detectado, se le debe hacer llegar un aviso-advertencia sobre la situación, informándole del tamaño de almacenamiento que está utilizando.
10.	Por último, se ha tomado la decisión de mover a un dispositivo de backup los ficheros cuyo tamaño excedan de los 500MB, e indicar en un fichero de log (/var/iog/user-storage-iMxseeHB.log) el mensaje correspondiente. Indica los cambios que añadirías al script previo para realizarlo.
11.	Apoyándote en la ayuda ofrecida por man, escribe una línea de comandos que nos proporcione el tamaño toral ocupado en disco por los elementos almacenados en un directorio.
12.	Ídem al ejercicio anterior, pero para una lista de directorios.
13.	Apoyándote en los ejercicios previos, crea un script que mueva a un directorio destino (argumento 2) todos los directorios del directorio fuente (argumento 1) cuya ocupación en disco sea superior a un tamaño dado (argumento 3).


