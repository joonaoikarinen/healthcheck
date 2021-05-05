#!/bin/bash

# This script deploys health check request to Debian Buster
# Running in 10 minute sequence utilizing cronjob

# Directory to install health check
TARGET_DIR=/opt/f-secure/healthcheck/
# Source directory
DEPLOY_DIR=$(dirname "$0")

# Install dependencies
sudo apt -y install python3-pip
sudo python3 -m pip install requests

# Create target and copy python script, apply permissions
mkdir -p "$TARGET_DIR"
cp "$DEPLOY_DIR"/health-check.py "$TARGET_DIR"
chmod +x "$TARGET_DIR"health-check.py

# Create cronjob, execute in 10 minute loop
(crontab -l; echo "*/10 * * * * ""$TARGET_DIR""health-check.py")|crontab -

exit 0
