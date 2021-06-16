#!/bin/bash

#This script configures your network and tests it.

ifconfig eth0 192.168.137.100 netmask 255.255.255.0
route add default gw 192.168.137.1

google="8.8.8.8"

pingtest(){
        for myHost in "$@"
        do
                ping -c 4 $google && return 1
        done
        return 0
}

if (pingtest $google) then
        # 100% failed
        echo "Server failed!"
else
        echo "Internet configured correctly!"
fi