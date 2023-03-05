#!/bin/bash

ip_address=$(hostname -I | awk '{print $1}')
subnet=$(echo $ip_address | cut -d. -f1,2,3)
active_hosts=()

for addr in ${subnet}.{1..254}; do
    if [ $addr != $ip_address ]; then
        ping -c 1 -w 1 $addr &> /dev/null
        if [ $? -eq 0 ]; then
            active_hosts+=($addr)
        fi
    fi
done

echo "Hosts activos en la red local:"
for host in ${active_hosts[@]}; do
    echo "- $host"
done
