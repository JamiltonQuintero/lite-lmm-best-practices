# LiteLLM Gateway Dockerfile
# Unified LLM proxy with 100+ providers support

FROM ghcr.io/berriai/litellm:main-latest

# Set working directory
WORKDIR /app

# Copy configuration
COPY config.yaml /app/config.yaml

# Expose port
EXPOSE 4000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:4000/health || exit 1

# Run LiteLLM proxy
CMD ["--config", "/app/config.yaml", "--port", "4000", "--detailed_debug"]
