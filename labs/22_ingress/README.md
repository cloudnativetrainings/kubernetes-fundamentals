# Ingress

In this training, we will setup an Ingress and expose an app showing a blue screen and an app showing a red screen.

>Navigate to the lab folder:

```bash
cd ${CODESPACE_VSCODE_FOLDER}/labs/22_ingress
```

## Create the red application

```bash
kubectl create -f red.yaml
```

## Create the blue application

```bash
kubectl create -f blue.yaml
```

## Verify your steps

```bash
kubectl get pods,svc
```

## Inspect and create the resources for the ingress controller

```bash
# install NGINX ingress controller
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --version 4.11.0

# verify everything is running
kubectl get deployments,pods,services -n ingress-nginx
```

## Inspect and create the ingress

```bash
kubectl create -f ingress.yaml
```

## Verify your ingress configuration

```bash
kubectl describe ing my-ingress
```

## Visit the applications "red" and "blue" in your browser via

```bash
kubectl get svc ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[].ip}'
```

Get the external IP of your LoadBalancer and vist via `curl`:

* `curl http://<EXTERNAL-IP>/red`
* `curl http://<EXTERNAL-IP>/blue`

If you want to reach it via browser, you first need to port-forward ingress-nginx-controller service:

```bash
kubectl port-forward svc/ingress-nginx-controller -n ingress-nginx 80
```

Then, reach via below URLs:

```bash
echo "https://${CODESPACE_NAME}-80.app.github.dev/red"
echo "https://${CODESPACE_NAME}-80.app.github.dev/blue"
```

## Clean up

```bash
kubectl delete -f .
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.5/deploy/static/provider/cloud/deploy.yaml
```
