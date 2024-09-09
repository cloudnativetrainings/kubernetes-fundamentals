# Helm

In this training, we will use Helm to create and customize an application.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/28_helm
```

## Verify if helm is installed

* Check helm

  ```bash
  helm version
  ```

* Ensure autocompletion is installed

  ```bash
  echo 'source <(helm completion bash)' >> ~/.bashrc && bash
  ```

## Do a release

* Show all releases

  ```bash
  helm ls
  ```

* Release with its default values

  ```bash
  helm install my-release-defaults ./my-chart
  ```

* Show all releases

  ```bash
  helm ls
  ```

* Show kubernetes resources

  ```bash
  kubectl get all
  ```

* Port forward the service port 80 to the local port 8080

  ```bash
  kubectl port-forward service/my-service 8080:80
  ```

* You can now access the service (in a seperate terminal)

  ```bash
  curl http://127.0.0.1:8080
  ```

* You may also reach it via codespaces URL on your browser:

  ```bash
  echo "https://${CODESPACE_NAME}-8080.app.github.dev/"
  ```

* You can stop the port-forwarding process via `CTRL + C`

* Delete a release

  ```bash
  helm delete my-release-defaults
  ```

## Do a customized release

* Release with a custom values.yaml file

  ```bash
  helm install my-release-custom ./my-chart -f my-values.yaml 
  ```

* Show all installed charts

  ```bash
  helm ls
  ```

* Show kubernetes resources

  ```bash
  kubectl get all
  ```

* Port forward the service port 80 to the local port 8080

  ```bash
  kubectl port-forward service/my-service 8080:80
  ```

* You can now access the service (in a seperate terminal)

  ```bash
  curl http://127.0.0.1:8080
  ```

* You may also reach it via codespaces URL on your browser:

  ```bash
  echo "https://${CODESPACE_NAME}-8080.app.github.dev/"
  ```

* You can stop the port-forwarding process via `CTRL + C`

## Upgrade a release

* Change the color in the file `my-values.yaml` to re-release

  ```bash
  helm upgrade my-release-custom ./my-chart -f my-values.yaml
  ```

* Show all releases

  ```bash
  helm ls
  ```

* Show kubernetes resources

  ```bash
  kubectl get all
  ```

* Port forward the service port 80 to the local port 8080

  ```bash
  kubectl port-forward service/my-service 8080:80
  ```

* You can now access the service (in a seperate terminal)

  ```bash
  curl http://127.0.0.1:8080
  ```

* You may also reach it via codespaces URL on your browser:

  ```bash
  echo "https://${CODESPACE_NAME}-8080.app.github.dev/"
  ```

* You can stop the port-forwarding process via `CTRL + C`

## Templating

* Add templating for the deployment in the file ./my-chart/templates/deployment.yaml

  ```yaml
  ...
  spec:
  replicas: {{ .Values.replicas }}
  selector:
  ...
  ```

## Customize your new release

* Add the replicas to the file my-values.yaml.

  ```yaml
  color: magenta
  replicas: 3
  ```

## Release

* Re-release

  ```bash
  helm upgrade my-release-custom ./my-chart -f my-values.yaml
  ```

* Show all releases

  ```bash
  helm ls
  ```

* Show kubernetes resources

  ```bash
  kubectl get pods
  ```

## Tips & Tricks

* Render yaml files without deploying them

  ```bash
  helm install my-chart ./my-chart --dry-run > dry.run
  ```

* Lint your charts

  ```bash
  helm lint ./my-chart
  ```

## Cleanup

```bash
helm delete my-release-custom
```
