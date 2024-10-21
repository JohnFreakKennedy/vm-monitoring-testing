# vm-monitoring-testing

## Running
```
helm dependency build
helm helm install vm-monitoring ./ --namespace monitoring --create-namespace
```


## Testing
There are 3 dashboards: Kubernetes Cluster Monitoring (via Prometheus), Spam2000 App Metrics Dashboard and Spam2000 Perfomance insights Dashboard

Custom dashboards are built from the metrics scraped from the `/metrics` endpoint of the app.
### Kubernetes cluster monitoring (via Prometheus)
This dashboard is configured by this implementation https://grafana.com/grafana/dashboards/315-kubernetes-cluster-monitoring-via-prometheus/.
![image] (https://imgur.com/QKEfM0L)

### Spam2000 App Metrics Dashboard
This dashboard provides a comprehensive overview of the spam2000 application's performance by visualizing key metrics: total_requests_processed, successful_requests, and error-rate. It incorporates an all-in-one filtration mechanism using template variables to filter data based on product, platform, email, name, and country. This allows for dynamic and granular monitoring tailored to specific segments of the application.


![image](https://imgur.com/hshE3Xa)

### Spam2000 Perfomance Insights Dashboard
This dashboard offers an in-depth analysis of the spam2000 application's performance by monitoring essential metrics: total_requests_processed, successful_requests, and error-rate. It leverages an all-in-one filtration mechanism through template variables, enabling users to filter and segment data based on product, platform, and country. The dashboard comprises gauge panels for real-time metrics visualization and timeseries panels to observe metric distributions across different dimensions.

![image](https://imgur.com/iAWMPtH)

### VictoriaMetrics UI

Run the following command:
```
kubectl port-forward svc/vm-monitoring-victoria-metrics-single-server 8428:8428 -n monitoring
```

so you can access targets, metrics and multiple VM resources (by prompting "localhost:8428")

![image](https://imgur.com/ma3Crx5)
![image](https://imgur.com/a/Bm6TERz)
