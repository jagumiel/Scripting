#!/bin/bash

# check if an interface name was provided as an argument
if [ -z "$1" ]
then
  echo "Please provide an interface name as an argument."
  exit 1
fi

# get the IP address associated with the interface
ip addr show dev "$1" | awk '/inet / {print $2}' | cut -d '/' -f1
