# Scripts
## _Procesos de Memoria_

En este apartado del repositorio se tratan los procesos, a quién pertenecen y cuántos recursos del sistema están consumiendo. De esta forma podemos saber cuánto tiempo llevan activos o cuanta memoria RAM o CPU están consumiendo. A partir de estos datos podemos hacer registros o tomar decisiones, como por ejemplo, detener procesos.


## Enunciados de los scripts

1.	No disponible.
2.	Crea un proceso en segundo plano (por medio de &). Pásalo a primer plano y otra vez atrás. Consigue su identificador, bájale la prioridad (renice) y finalmente hazlo terminar.
3.	Por cada usuario que tenga al menos un proceso en ejecución, indica cuántos procesos en ejecución tiene en total.
4.	Muestra todos los procesos en el Sistema, pero con los siguientes campos y en el siguiente orden: pid, uid, pcpu, cmd, time
5.	Mostrar aquellos procesos que estén a la espera de un evento para completarse.
6.	Obten la lista de los procesos (PIDs) de usuario que tienen un tiempo de CPU superior a 120 segundos (00:02:00). Por cada proceso detectado, añadir su PID UID PCPU TCPU y CMD en el fichero /var/log/Lista-procesos-ExcesoCPU.txt.
7.	A partir del resultado previo, filtrar aquellos procesos cuyo porcentaje de uso de CPU sea superior al 20%.
8.	Usando el script anterior, finalizar todos los procesos cuyo porcentaje de uso de CPU sea superior al 20%.
