#!/bin/bash

for ip in 127.0.0.{1..255}; do
    for port in {20..25}; do
        (echo >/dev/tcp/$ip/$port) >/dev/null 2>&1 && echo "$ip:$port esta abierto"
    done
done
