# Use official ActualBudget image
FROM actualbudget/actual-server:latest

# Set working directory
WORKDIR /app

# Expose port (Railway will override if needed)
EXPOSE 3006

# Environment variables
ENV NODE_ENV=production
ENV ACTUAL_PORT=3006
ENV DB_PATH=/data

# Volume for persistent data storage
VOLUME ["/data"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:3006/ || exit 1

# Start the server
CMD ["npm", "start"]
