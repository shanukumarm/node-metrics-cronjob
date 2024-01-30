# Use a lightweight base image
FROM alpine:latest

# Install curl
RUN apk --no-cache add curl

# Copy the bash script into the container
COPY pull_metrics.sh /pull_metrics.sh

# Make the script executable
RUN chmod +x /pull_metrics.sh

# Run the script when the container starts
CMD ["/pull_metrics.sh"]
