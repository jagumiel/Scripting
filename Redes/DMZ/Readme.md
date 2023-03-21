# DMZ (De-Militarized Zone)

Una DMZ (De-Militarized Zone) es un término de seguridad informática utilizado para describir una subred física o lógica que contiene y expone los servicios externos de una organización a una red mayor y no fiable, normalmente Internet. El propósito de una DMZ es añadir una capa adicional de seguridad a la red local de una organización, proporcionando un entorno protegido para alojar servicios como servidores Web, servidores de correo electrónico, servidores FTP, etcétera.

En una configuración DMZ, todo el tráfico entrante procedente de Internet se redirige a la red DMZ y, a continuación, es filtrado por un cortafuegos antes de permitirle el acceso a la red interna. La DMZ actúa como una zona tampón entre Internet y la red interna, reduciendo la exposición de la red interna a posibles amenazas.

En resumen, las redes DMZ se utilizan para proteger la red interna de una organización aislando los servicios públicos y aumentando la seguridad general.

#Ejercicios
Se le proporciona un script de shell que configura un cortafuegos con tres interfaces (DMZ, LAN, INTERNET) y establece reglas utilizando iptables. El script define las direcciones IP e interfaces para cada red, así como reglas específicas para servicios como servidores web en la LAN y DMZ.

Su tarea es añadir las siguientes reglas al script:

3. Asumiendo una configuración de red con una LAN y una DMZ, configure iptables para permitir tráfico ICMP para peticiones y respuestas echo entre hosts en la LAN y DMZ. Utilice las siguientes variables:
    - $LAN_IFACE: la interfaz de red conectada a la LAN
    - $LAN_IP: la dirección IP asignada a la interfaz LAN
    - $DMZ_IFACE: la interfaz de red conectada a la DMZ
    - $DMZ_IP: la dirección IP asignada a la interfaz DMZ
    
    Para ello se puede descomponer en los siguientes pasos:
        a) Permitir solicitudes de eco de LAN a DMZ.
        b) Permitir respuestas de eco de DMZ a LAN.
        c) Permitir solicitudes de eco de DMZ a LAN.
        d) Permitir respuestas eco de LAN a DMZ.

4. Asumiendo una topología de red con una red de área local (LAN) y una zona desmilitarizada (DMZ) que contiene servidores web accesibles desde Internet. Escriba una sentencia de ejercicio para configurar IPTABLES para permitir tráfico HTTP y HTTPS entre hosts en la LAN y los servidores web en la DMZ. Utilice los siguientes parámetros:
    - $LAN_IFACE: nombre de la interfaz de red para la LAN
    - $DMZ_IFACE: nombre de la interfaz de red para la DMZ
    - $LAN_IP: dirección IP de la red LAN
    - $DMZ_WEB_IP: dirección IP del servidor o servidores web en la DMZ
    
    Tarea: Escribir los comandos iptables para configurar el cortafuegos de forma que permita el tráfico HTTP y HTTPS entre las redes LAN y DMZ.
    > **_Nota:_**  Nota: Asumir que el resto del tráfico está bloqueado por defecto, y que los servidores web están escuchando en los puertos 80 (HTTP) y 443 (HTTPS).

5.
6. a) Permitir solicitud de eco ICMP desde LAN a cualquier IP en la red INTERNET, y respuesta de eco ICMP desde cualquier IP en la red INTERNET a LAN.

7. a) Configurar NAT para que cualquier tráfico entrante en el puerto 80 o 443 a la IP pública del cortafuegos (INTERNET_IFACE_IP) sea redirigido al servidor web en la DMZ (DMZ_WEB_IP).
