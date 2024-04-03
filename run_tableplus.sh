#!/bin/bash

# Initialize a flag to indicate whether cleanup has been performed
cleanup_done=0

# Function to revoke xhost permissions
cleanup() {
    if [ $cleanup_done -eq 0 ]; then
        echo "Revoking xhost permissions..."
        xhost -local:
        cleanup_done=1
    fi
}

# Trap SIGINT (Ctrl+C) and SIGTERM to call the cleanup function
trap cleanup SIGINT SIGTERM

# Grant xhost permissions to allow local connections
echo "Granting xhost permissions for local connections..."
xhost +local:

# Start the TablePlus container with docker-compose
echo "Starting TablePlus container..."
docker-compose up

# Call the cleanup function on script exit
cleanup
