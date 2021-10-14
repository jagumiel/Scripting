# Scripts
## _Configuración de Redes y Seguridad_

En este apartado del repositorio los scripts están relacionados con la administración de redes y la configuración del cortafuegos. Se utilizan IPTables.

## Enunciados: Configuración de la red

1.	Utilizando ifconfig, ip o webmin examina cómo está configurada la conexión a red del sistema: si es una configuración estática, a través de DHCP, los interfaces, servidor de nombres, puerta de enlace ...
2.	Si el sistema asigna una dirección IP de modo dinámico, configura el sistema para que dicha configuración sea asignada de modo estático. Tras comprobar que funciona, vuelve a la configuración original.
3.	Examina la configuración de red listando la información sobre interfaces, tabla de encaminamiento y puertos abierto.
4.	Modifica la configuración de red para que el sistema se pueda conectar a la red local, pero no al exterior (comando route).
5.	Programa un script que, obteniendo como parámetro uno de sus interfaces de red activos, obtenga la dirección IP asociada.
6.	Programa un script que proporcione la lista de direcciones IP activas en su red local, entendiendo por máquinas activas aquellas que responden al comando ping y por red local el conjunto de direcciones IP que se obtiene al aplicar la máscara 255.255.255.0 a la propia dirección IP.
7.	Comprueba la velocidad y por qué nodos atraviesa la comunicación con la dirección http://www.elhuyar.com. Haz lo mismo para la dirección http://www.ehu.es
**Nota:** Este ejercicio depende de la configuración de la red local, es posible que no pueda ser puesto en práctica.
8.	Haz un script que compruebe cada hora la conectividad con los siguientes nodos:
    - El propio sistema local (localhost)
    - La red local
    - Algún nodo próximo: ej. http:www.ehu.es
    - Algún servidor fiable: ej. http://www.google.com y http://www.gnu.org 
9.	Indica un método para poder ejecutar comandos en modo remoto mediante netcat.
10.	Crea un script que monitorize el rango de puertos de 20 a 25 de todas las máquinas en la red 127.0.0.x.

## Enunciados y Soluciones: Cortafuegos. Seguridad.

1.	Consultar la configuración actual del cortafuegos.
    ```
    iptables -L
    ```
2.	Utilizar iptables para conseguir la siguiente configuración:
    - Prohibir todo el tráfico por encima del puerto 8192, excepto el correspondiente al sistema local y el servicio webmin. Este último servicio sólo podrá ser accedido por el sistema local y por el sistema host (anfitrión de la máquina virtual VMWare).
        ```
        iptables -A INPUT -s localhost -p tcp --dport webmin -j ACCEPT      
        iptables -A INPUT -p tcp --dport 8192:65535 -j DROP
        ```
    - El servicio ftp sólo puede ser accedido por la máquina virtual y el host.
        ```
        ifconfig #En la consola. Para saber la dirección del host.
        iptables -A INPUT -s HOST -p tcp --dport 21 -jaccept
        ```
    - Los servicios SSH y web abiertos para todos.
        ```
        less /etc/services #En consola. Muestra los puertos que usan los servicios.
        iptables -A INPUT -p tcp --dport ssh -j ACCEPT
        iptables -A INPUT -p tcp --dport 80 -j ACCEPT
        ```
    - El resto de puertos abiertos para la red local pero no para Internet.
        ```
        iptables -A INPUT -p tcp --dport 1:65535 -s 192.168.0.0/24 -j ACCEPT
        iptables -A INPUT -p tcp --dport 1:65535 -s 127.0.0.0/8 -j ACCEPT
        iptables -A INPUT -p tcp --dport 1:65535 -j DROP
        ```
3.	Configurar el sistema para que la configuración del cortafuegos del apartado anterior tenga efecto en cuanto se inicie el sistema.
    ```
    Se crea un script con los comandos anteriores.
    El script tiene que arrancarse en init.d. Se sigue el esquema del /etc/init.d/skeleton.
    ```
