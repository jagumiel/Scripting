#!/bin/bash

# Iterate over all users in the system
for user in $(cut -d: -f1 /etc/passwd); do
  # Get the user and group IDs for the current user
  user_id=$(id -u "$user")
  group_id=$(id -g "$user")

  # Check if the user and group IDs are different
  if [ "$user_id" != "$group_id" ]; then
    # Print the name of the user
    echo $user
  fi
done
