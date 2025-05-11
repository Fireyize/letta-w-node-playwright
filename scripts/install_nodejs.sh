#!/bin/sh
if ! command -v node >/dev/null 2>&1; then
  echo 'Installing Node.js...'
  apt-get update && apt-get install -y curl
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt-get install -y nodejs
  apt-get clean
fi