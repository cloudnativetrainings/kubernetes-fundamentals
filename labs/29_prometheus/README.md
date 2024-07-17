# Prometheus

In the training, we will learn about Prometheus.

>Navigate to the lab folder:

```bash
cd ${CODESPACE_VSCODE_FOLDER}/labs/29_prometheus
```

## Create a pod

```bash
kubectl create -f pod.yaml
```

## Prometheus deployment

* Install prometheus

  ```bash
  helm install my-prometheus prometheus \
    --repo https://prometheus-community.github.io/helm-charts
  ```

* Take a look at the installed resources

  ```bash
  helm list
  kubectl get all
  ```

* Visit the prometheus UI in the browser by port-forwarding to reach the codespaces instance:

  ```bash
  kubectl port-forward svc/my-prometheus-server 80
  ```

* Reach via below URL:

  ```bash
  echo "https://${CODESPACE_NAME}-80.app.github.dev
  ```

* Execute some query over the "graph" page in your browser
  * http requests: `container_memory_usage_bytes`
  * API server requests count: `container_memory_usage_bytes{pod="my-pod",container="nginx"}`
  * per-second rate of increase, messured over the last 5 min: `rate(container_memory_usage_bytes{pod="my-pod",container="nginx"}[5m])`
  * predict memory usage in 24 hours based on the rate of the last 5 minutes: `predict_linear((container_memory_usage_bytes{pod="my-pod",container="nginx"}[5m]),24*3600)`
  * more examples: [https://prometheus.io/docs/prometheus/latest/querying/examples](https://prometheus.io/docs/prometheus/latest/querying/examples)

## Grafana

* Install grafana

  ```bash
  helm install my-grafana grafana \
    --repo https://grafana.github.io/helm-charts \
    -f grafana-values.yaml
  ```

* Visit the grafana UI in the browser by Port-forwarding to reach the codespaces instance:

  ```bash
  kubectl port-forward svc/my-grafana 80
  ```

* Reach via below URL:

  ```bash
  echo "https://${CODESPACE_NAME}-80.app.github.dev
  ```

* Add Prometheus as data source to Grafana
  * Choose the Option `Connections`/`Data Sources`
  * Click on `Add Data Source`
  * Choose type `Prometheus`
  * Insert URL `http://my-prometheus-server` and click `Save & Test`
  * Choose the Option `Dashboards`/`New`/`Import`
  * Paste the number 1860 into the field `Grafana.com Dashboard` and click `Load` (Visit [https://grafana.com/grafana/dashboards](https://grafana.com/grafana/dashboards) for other Dashboards)
  * Choose the Datasource Prometheus in the field `Prometheus` and `Import` afterwards
  * Investigate the Dashboard; take care to a proper time range via the button on the right above

## Clean up

* Clean up the setup

  ```bash
  helm delete my-grafana
  helm delete my-prometheus
  kubectl delete pod my-pod
  ```

