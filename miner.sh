#!/bin/bash

# Verus miner script for Termux

# Mining pool configuration (default to na.luckpool)
POOL_URL="stratum+tcp://na.luckpool.net:3956"
USER_ADDRESS="your-verus-wallet-address"
WORKER_NAME="Termux-Miner"

# Check for the presence of required software
if ! command -v verus-miner &> /dev/null; then
    echo "Verus miner not installed! Please install dependencies."
    exit 1
fi

echo "Starting mining on pool: $POOL_URL..."

# Run the miner with fallback solutions if the pool fails
while true; do
    verus-miner -o $POOL_URL -u $USER_ADDRESS.$WORKER_NAME -p x
    if [ $? -ne 0 ]; then
        echo "Error detected! Retrying with fallback pool..."
        # Fallback pool
        POOL_URL="stratum+tcp://us.luckpool.net:3956"
    else
        break
    fi
done
