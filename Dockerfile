# Use a lightweight base image
FROM alpine:latest

# Install curl
RUN apk --no-cache add curl

# Copy the bash script into the container
COPY node_metric_collector.sh /node_metric_collector.sh

# Make the script executable
RUN chmod +x /node_metric_collector.sh

# Run the script when the container starts
CMD ["sh", "/node_metric_collector.sh"]
