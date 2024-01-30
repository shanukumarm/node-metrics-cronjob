#!/bin/bash

# Define directory to store metrics files
METRICS_DIR="/metrics"
mkdir -p $METRICS_DIR

# Fetch node metrics using Node Exporter
NODE_EXPORTER_URL="http://node-exporter:9100/metrics"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
METRICS_FILE="$METRICS_DIR/node_metrics_$TIMESTAMP.txt"

# Retrieve CPU, Memory, and Disk metrics from Node Exporter
CPU_USAGE=$(curl -s $NODE_EXPORTER_URL | grep 'node_cpu_seconds_total' | awk '{print $2}')
MEMORY_USAGE=$(curl -s $NODE_EXPORTER_URL | grep 'node_memory_MemTotal_bytes' | awk '{print $2}')
DISK_USAGE=$(curl -s $NODE_EXPORTER_URL | grep 'node_filesystem_size_bytes' | grep 'device="/dev/root"' | awk '{print $2}')

# Write metrics to file with timestamped filename
echo "CPU Usage: $CPU_USAGE" > $METRICS_FILE
echo "Memory Usage: $MEMORY_USAGE" >> $METRICS_FILE
echo "Disk Usage: $DISK_USAGE" >> $METRICS_FILE
