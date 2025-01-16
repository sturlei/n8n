ARG NODE_VERSION=20
FROM n8nio/base:${NODE_VERSION}

# Set environment variables
ENV NODE_ENV=production
ENV N8N_RELEASE_TYPE=stable

# Install n8n
RUN npm install -g n8n

# Create and set permissions for n8n directory
RUN mkdir .n8n && \
    chown node:node .n8n

# Set the shell
ENV SHELL /bin/sh

# Switch to non-root user
USER node

# Expose the default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
