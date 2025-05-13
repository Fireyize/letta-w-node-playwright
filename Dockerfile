FROM letta/letta:latest

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Copy your custom installation scripts into the image
COPY ./scripts/install_nodejs.sh /tmp/install_nodejs.sh
COPY ./scripts/install_playwright.sh /tmp/install_playwright.sh

# Make them executable
RUN chmod +x /tmp/install_nodejs.sh && \
    chmod +x /tmp/install_playwright.sh

# Run the scripts to install Node.js and then Playwright
# It's crucial that install_nodejs.sh runs first
RUN /tmp/install_nodejs.sh
RUN /tmp/install_playwright.sh

# Clean up apt cache
RUN rm -rf /var/lib/apt/lists/*

# The original ENTRYPOINT and CMD from letta/letta:latest will be used
# to start Leta after these RUN commands complete.