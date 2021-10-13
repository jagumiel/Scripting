#!/bin/sh
# FW con tres patas (DMZ, LAN, INTERNET)
#
#
# Configuración
# Interfaces
LO_IFACE=lo
LAN_IFACE=eth1
DMZ_IFACE=eth2
INTERNET_IFACE=eth0
#
# @IP interfaces
LO_IFACE_IP=127.0.0.1
LAN_IFACE_IP=192.168.1.1
DMZ_IFACE_IP=10.10.10.1
INTERNET_IFACE_IP=172.16.0.34
#
# @IP redes
LAN_IP=192.168.1.0/24
DMZ_IP=10.10.10.0/24
ANY_IP=0.0.0.0/0
#
# Servicios
LAN_WEB_IP=192.168.1.10
DMZ_WEB_IP=10.10.10.30
#
######  Reglas iptables 
#
### FILTER
# Vaciar reglas
iptables -F
iptables -X
iptables -Z
#
# INSERTAR AQUÍ fw-rules2.txt
# INSERTO LAS REGLAS DEL FICHERO
#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP
#
# Reglas auxiliares
# desde la interface localhost a las @IP's locales            
#iptables -A INPUT -p ALL -i $LO_IFACE -s $LO_IFACE_IP -j ACCEPT
#iptables -A INPUT -p ALL -i $LO_IFACE -s $LAN_IFACE_IP -j ACCEPT
#iptables -A INPUT -p ALL -i $LO_IFACE -s $DMZ_IFACE_IP -j ACCEPT
#iptables -A INPUT -p ALL -i $LO_IFACE -s $INTERNET_IFACE_IP -j ACCEPT
# Permitir salida solo por @IP's locales
#iptables -A OUTPUT -p ALL -s $LO_IFACE_IP -j ACCEPT
#iptables -A OUTPUT -p ALL -s $LAN_IFACE_IP -j ACCEPT
#iptables -A OUTPUT -p ALL -s $DMZ_IFACE_IP -j ACCEPT
#iptables -A OUTPUT -p ALL -s $INTERNET_IFACE_IP -j ACCEPT
#
####### INSERTAR AQUÍ fw-rules3.txt
# INSERTO LAS REGLAS DEL FICHERO
#
#iptables -A INPUT -i $LAN_IFACE -s $LAN_IP \
#                  -p icmp -m icmp --icmp-type echo-request \
#                  -m state --state NEW -j ACCEPT
#iptables -A OUTPUT -o $LAN_IFACE -d $LAN_IP \
#                   -p icmp -m icmp --icmp-type echo-reply \
#                   -m state --state RELATED,ESTABLISHED -j ACCEPT
#iptables -A INPUT -i $DMZ_IFACE -s $DMZ_IP \
#                  -p icmp -m icmp --icmp-type echo-request \
#                  -m state --state NEW -j ACCEPT
#iptables -A OUTPUT -o $DMZ_IFACE -d $DMZ_IP \
#                   -p icmp -m icmp --icmp-type echo-reply \
#                   -m state --state RELATED,ESTABLISHED -j ACCEPT
#
####### INSERTAR AQUÍ fw-rules4.txt
# INSERTO LAS REGLAS DEL FICHERO
# 
#iptables -A FORWARD -i $LAN_IFACE -s $LAN_IP \
#                    -o $DMZ_IFACE -d $DMZ_WEB_IP \
#                    -p tcp -m multiport --dport 80,443 -j ACCEPT
#iptables -A FORWARD -o $LAN_IFACE -d $LAN_IP \
#                    -i $DMZ_IFACE -s $DMZ_WEB_IP \
#                    -p tcp -m multiport --sport 80,443 -j ACCEPT
#
# log all dropped packets in /var/log/messages
#iptables -A INPUT -j LOG --log-prefix "INPUT DROPPED:"
#iptables -A OUTPUT -j LOG --log-prefix "OUTPUT DROPPED:"
#iptables -A FORWARD -j LOG --log-prefix "FORWARD DROPPED:"
#
#
## INSERTAR AQUÍ reglas ejercicio 6a
# INSERTO LAS REGLAS
#iptables -A FORWARD -i $LAN_IFACE -s $LAN_IP -o $INTERNET_IFACE -d $ANY_IP -p icmp -m icmp --icmp-type echo-request -m state NEW -j ACCEPT
#iptables -A FORWARD -o $LAN_IFACE -d $LAN_IP -i $INTERNET_IFACE -s $ANY_IP -p icmp -m icmp --icmp-type echo-reply -m state RELATED,ESTABLISHED -j ACCEPT
### NAT
# Vaciar reglas
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z
#
# INSERTAR AQUÍ reglas auxiliares ejercicio 7a
# INSERTO LAS REGLAS
iptables -t nat -A PREROUTING -i $INTERNET_IFACE -p TCP -d $INTERNET_IFACE_IP --dport 80 -j DNAT --to-destination $DMZ_WEB_IP
iptables -t nat -A PREROUTING -i $INTERNET_IFACE -p TCP -d $INTERNET_IFACE_IP --dport 443 -j DNAT --to-destination $DMZ_WEB_IP
iptables -t nat -P PREROUTING DROP
iptables -t nat -P POSTROUTING DROP
# Reglas
#
# INSERTAR AQUÍ regla ejercicio 6b
# INSERTO LAS REGLAS
#iptables -t nat -A POSTROUTING -o $INTERNET_IFACE -j SNAT --to-source $INTERNET_IFACE_IP
# INSERTAR AQUÍ regla ejercicio 5
# INSERTO LA REGLA
#iptables -t nat -A POSTROUTING -o $DMZ_IFACE -p all -s $LAN_IP -d $DMZ_IP -j MASQUERADE
# INSERTAR AQUÍ fw-rules7.txt
# INSERTO LAS REGLAS DEL FICHERO
# Forwarding al servicio web en la DMZ
iptables -t nat -A PREROUTING -i $INTERNET_IFACE \
                -d $INTERNET_IFACE_IP -p tcp --dport 80 \
                --sport 1024:65535 -j DNAT --to-destination $DMZ_WEB_IP:80
iptables -t nat -A PREROUTING -i $INTERNET_IFACE \
                -d $INTERNET_IFACE_IP -p tcp --dport 443 \
                --sport 1024:65535 -j DNAT --to-destination $DMZ_WEB_IP:443
#
# Reglas auxiliares
# Validar que en loopback solo llegan paquetes de las @IP's locales
iptables -t nat -A PREROUTING -i $LO_IFACE -s $LO_IFACE_IP -j ACCEPT 
iptables -t nat -A PREROUTING -i $LO_IFACE -s $LAN_IFACE_IP -j ACCEPT     
iptables -t nat -A PREROUTING -i $LO_IFACE -s $DMZ_IFACE_IP -j ACCEPT              
iptables -t nat -A PREROUTING -i $LO_IFACE -s $INTERNET_IFACE_IP -j ACCEPT 
iptables -t nat -A POSTROUTING -s $LO_IFACE_IP -j ACCEPT
iptables -t nat -A POSTROUTING -s $LAN_IFACE_IP -j ACCEPT
iptables -t nat -A POSTROUTING -s $DMZ_IFACE_IP -j ACCEPT              
iptables -t nat -A POSTROUTING -s $INTERNET_IFACE_IP -j ACCEPT 
#
# Validar que en las interfaces llegan paquetes de la red correspondiente
iptables -t nat -A PREROUTING -i $LAN_IFACE -s $LAN_IP -j ACCEPT
iptables -t nat -A PREROUTING -i $DMZ_IFACE -s $DMZ_IP -j ACCEPT
iptables -t nat -A POSTROUTING -o $LAN_IFACE -d $LAN_IP -j ACCEPT
iptables -t nat -A POSTROUTING -o $DMZ_IFACE -d $DMZ_IP -j ACCEPT
#
#
## log all dropped packets in /var/log/messages
iptables -t nat -A PREROUTING -j LOG --log-prefix "PREROUTING DROPPED:"
iptables -t nat -A POSTROUTING -j LOG --log-prefix "POSTROUTING DROPPED:"










