#!/bin/bash

# Define directory to store metrics files
METRICS_DIR="/metrics"
mkdir -p $METRICS_DIR

# Fetch node metrics using Node Exporter
NODE_EXPORTER_URL="http://node-exporter:9100/metrics"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
METRICS_FILE="$METRICS_DIR/node_metrics_$TIMESTAMP.txt"
curl -s $NODE_EXPORTER_URL > $METRICS_FILE
