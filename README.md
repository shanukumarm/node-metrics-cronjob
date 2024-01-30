# Node-Metrics-Cronjob

- Assumptions:
  - Node Exporter is deployed and accessible within the Kubernetes cluster.
  - The directory /metrics exists in the container and is writable.

- Deployment:
  - Build the Docker image: docker build -t node-metrics .
  - Push the Docker image to your Docker registry if necessary: docker push node-metrics
  - Replace <your-docker-image> in cronjob.yaml with the image name.
  - Deploy the cron job: kubectl apply -f cronjob.yaml

- Accessing Metrics:
  - Metrics files will be stored in the /metrics directory within the container.

- Retention on Pod Restarts:
  - Metrics files will be retained within the container filesystem unless explicitly removed.

- Cleanup:
  - To delete the cron job: kubectl delete cronjob node-metrics-cronjob

- Additional Notes:
  - Ensure proper RBAC permissions for the cron job to access Node Exporter.
  - Test thoroughly in a development environment before deploying to production.