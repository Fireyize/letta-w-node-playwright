#!/bin/sh

echo "Checking for Node.js..."
if ! command -v node >/dev/null 2>&1; then
  echo 'Node.js not found. Installing Node.js 18.x...'

  # Ensure apt-get can run successfully
  echo "Updating package lists..."
  apt-get update
  if [ $? -ne 0 ]; then
    echo "apt-get update failed. Exiting."
    exit 1
  fi

  echo "Installing curl..."
  apt-get install -y curl
  if [ $? -ne 0 ]; then
    echo "Failed to install curl. Exiting."
    exit 1
  fi

  echo "Adding NodeSource repository for Node.js 18.x..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  if [ $? -ne 0 ]; then
    echo "Failed to add NodeSource repository. Exiting."
    # It's possible the script exits here if bash - fails,
    # so the error might not even reach here if curl | bash fails.
    exit 1
  fi
  
  echo "Installing Node.js..."
  apt-get install -y nodejs
  if [ $? -ne 0 ]; then
    echo "Failed to install Node.js. Exiting."
    exit 1
  fi

  echo "Cleaning up apt cache..."
  apt-get clean

  echo "Node.js installation attempt finished."
else
  echo 'Node.js is already installed.'
fi

# Verify node and npm installation
if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
  echo "Node.js and npm successfully installed/verified."
  node -v
  npm -v
else
  echo "ERROR: Node.js or npm installation failed or not found in PATH."
  exit 1
fi