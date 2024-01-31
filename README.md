# Node Metrics Collection
This repository contains resources and instructions for collecting node metrics using node-exporter and a custom metric collector script (`node-metric-collector.sh`). It includes steps to deploy node-exporter, build a Docker image for the metric collector script, and deploy a cronjob with persistent storage for metric collection using `kustomize` and `Helm`.

## Deployment Instructions
  ### 1. Node Exporter Installation

    Node exporter can be installed using kustomize. Follow these steps:
    1. Apply the configuration using `kubectl apply -k node-exporter/.`.

  ### 2. Building Docker Image for Metric Collector Script

    The metric collector script (`node-metric-collector.sh`) needs to be built into a Docker image. Follow these steps:
    1. Use the provided Dockerfile to build the image.
      `docker build -t node-metric-collector:0.0.1 .`

  ### 3. Deploying Cronjob with PV and PVC
  ####  a. Using Kustomize

      To deploy the cronjob with persistent volume (PV) and persistent volume claim (PVC) using `kustomize`, follow these steps:
      1. Apply the configuration using `kubectl apply -k node-metric-collector/.`.
  ####  b. Using Helm

      To deploy the cronjob with persistent volume (PV) and persistent volume claim (PVC) using Helm, follow these steps:
      1. Install the Helm chart with the desired configuration values.
        `helm install node-metric-collector-helm node-metric-collector-helm/.`
    
## Usage

  Once deployed, the cronjob will collect node metrics at the specified schedule and store them in the persistent volume.

  ### Accessing Metrics

    - To access the collected metrics, inspect the contents of the persistent volume mounted at `/persistent/metrics/node`.

  ### Customization
  
    - Modify the schedule and storage size as needed in the 'kustomize' file or Helm chart values.
    - Customize the metric collection script (`node-metric-collector.sh`) according to specific requirements.
