#!/bin/sh
# Install Playwright if not already installed
if [ ! -d "/usr/local/lib/node_modules/playwright" ]; then
  echo 'Installing Playwright...'
  npx playwright install-deps
  npx playwright install firefox --with-deps
fi