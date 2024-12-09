#!/bin/bash

# A script to update Verus miner from GitHub

echo "Checking for updates..."

# Pull the latest code from GitHub
git pull origin main

# Reinstall dependencies (if any updates are needed)
pkg update && pkg upgrade -y
pkg install -y libmicrohttpd

echo "Update complete."
