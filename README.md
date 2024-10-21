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
![image](https://github.com/user-attachments/assets/f3d6a74e-63ea-4b84-98e7-9450b74cd8ec)

### Spam2000 App Metrics Dashboard
This dashboard provides a comprehensive overview of the spam2000 application's performance by visualizing key metrics: total_requests_processed, successful_requests, and error-rate. It incorporates an all-in-one filtration mechanism using template variables to filter data based on product, platform, email, name, and country. This allows for dynamic and granular monitoring tailored to specific segments of the application.

![image](https://github.com/user-attachments/assets/540767ac-2780-4c8e-8a0c-202863792b69)

### Spam2000 Perfomance Insights Dashboard
This dashboard offers an in-depth analysis of the spam2000 application's performance by monitoring essential metrics: total_requests_processed, successful_requests, and error-rate. It leverages an all-in-one filtration mechanism through template variables, enabling users to filter and segment data based on product, platform, and country. The dashboard comprises gauge panels for real-time metrics visualization and timeseries panels to observe metric distributions across different dimensions.

![image](https://github.com/user-attachments/assets/c6ba021a-c027-402a-91bf-87c1a57796df)

### VictoriaMetrics UI

Run the following command:
```
kubectl port-forward svc/vm-monitoring-victoria-metrics-single-server 8428:8428 -n monitoring
```

so you can access targets, metrics and multiple VM resources (by prompting "localhost:8428")

![image](https://github.com/user-attachments/assets/a4c646d3-70bd-49c4-915f-b906aff2a9d2)
![image](https://github.com/user-attachments/assets/f85e5b1b-9369-451f-9611-7b0b8f57b11f)

