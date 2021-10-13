# Scripts
## _Cuentas, grupos y contabilidad_

En este apartado del repositorio se trabaja con la creación de cuentas de usuarios y grupos. Se hace hincapié en la obtención de datos de interés, como el UID o el GID y en la automatización para la administración de estas actividades.


## Enunciados de los scripts

1.	Crea un script que, dado un nombre de usuario como argumento, escriba en la salida estándar el código de usuario (UID) que le corresponde.
2.	Crea un script que, dado un nombre de grupo como argumento, escriba en la salida estándar el código de grupo (GID) que le corresponde.
3.	Crea un script que dado un código de usuario (UID) como argumento, escriba en la salida estándar el nombre de usuario que le corresponde.
4.	Crea un script que dado un código de grupo (GID) como argumento, escriba en la salida estándar el nombre de grupo que le corresponde.
5.	Crea un script que enumere las cuentas de tipo superusuario.
6.	Crea dos nuevos usuarios: user2y user3. Prueba con useradd, adduser y mediante webmin). 
    Es posible que Webmin no esté instalado. Para inatalarlo hay que seguir los siguientes pasos:
    ```
    wget http://prdownloads.sourceforge.net/webadmin/webmin_X.YYY_all.deb
    sudo dpkg -i webmin_X.YYY_all.deb
    sudo /etc/webmin/start
    ```
    Desde el navegador de internet accedemos a webmin a través de la siguiente dirección:
    ```
    https://localhost:10000/
    ```
    Al terminar, se recomienda detener el servicio por razones de seguridad:
    ```
    sudo /etc/webmin/stop
    ```
7.	Crea un grupo, de nombre p1. Incluye a los usuarios user2 y user3 en dicho grupo.
8.	Crea una carpeta p1 en el directorio /home/proyectos. Asigna (a la carpeta p1) permiso de lectura y escritura para el grupo (p1) creado en el punto anterior. Los usuarios que no estén en dicho grupo no pueden leer ni escribir en el contenido de dicho directorio.
9.	Configura el sistema para que los ficheros creados dentro del directorio /home/proyectos/pi sean accesible para los miembros del grupo (p1).
10.	Crea un script que, recibiendo como parámetros el nombre del grupo y sus miembros, realice todos los pasos anteriores. El script deberá controlar su salida estándar y errores. Junto con el código de finalización (éxito o error).
11.	Crea un script que, realice la creación de cuentas de usuario y genere un fichero con un listado de las mismas. El script tiene tres parámetros:
•	El nombre raíz de las cuentas
•	El nombre del directorio raíz donde se deben crear los directorios de trabajo de las cuentas.
•	El número de cuentas a generar.
Todas las cuentas deberán incluirse en el grupo cuyo nombre corresponde con el nombre raíz de las cuentas (el primer parámetro).
Los identificadores de usuario de las cuentas deben ser asignados a partir del valor 3000, es decir, 3000, 3001, 3002, ... (3000 + n-1)
A cada cuenta se le debe asignar una contraseña inicial aleatoria. Puedes utilizar el siguiente comando para generar una clave aleatoria de 12 caracteres:
    ```
    $ tr -dc A-Za-z0-9".,:;_<>-" < /dev/urandom | head -c12
    ```
    El fichero con el listado de las cuentas /var/iog/users-acaasr.log tiene el siguiente formato:
    ```
    Usuario         Contraseña
    acasr0000       Q8iWVPCKmUcs
    acasr0001       pHUpP98P8PBb
    acasr0002       h9KGW3C1Gz_H
    ...
    acasrxxxx       zfCdN1l.BbWN
    ```
12. Por razones de segundad, queremos que cuando un usuario acceda al sistema por primera vez, se vea obligado a cambiar la clave. Modifica el script del ejercicio previo para que contemple esta restricción.

