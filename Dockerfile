# Use a specific version and an Alpine Linux base for a smaller, more secure image.
FROM rabbitmq:3.12-management-alpine

# Add a healthcheck so Docker knows if the container is actually processing requests, not just running.
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD rabbitmq-diagnostics -q ping || exit 1

# Note: The official RabbitMQ image automatically runs as the 'rabbitmq' user (UID 999).