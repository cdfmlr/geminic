FROM node:20-slim

# Install gemini-cli globally
RUN npm install -g @google/gemini-cli@latest

# Additional packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl inetutils-ping git && \
    rm -rf /var/lib/apt/lists/*

# Add a startup script to print a friendly hint
COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]

