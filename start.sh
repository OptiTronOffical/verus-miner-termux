#!/bin/bash

# A script to start the Verus miner for Termux

echo "Starting Verus miner..."

# Check if miner is already running
if pgrep -f "miner.sh" > /dev/null; then
    echo "Miner is already running!"
    exit 1
fi

# Start the miner in the background
./miner/miner.sh &

echo "Miner started successfully!"
