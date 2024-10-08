# ConfigMaps

In the training, we will learn about Configmaps.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/09_configmaps
```

## Inspect configmap.yaml definition file and create the configmap

```bash
cat configmap.yaml
kubectl create -f configmap.yaml
```

## Inspect pod.yaml definition file and create the pod

>Note that, there are errors in the yaml files. Try to fix them. Check the output of `kubectl describe pod my-pod` to debug the issues.

```bash
cat pod.yaml
kubectl create -f pod.yaml
```

## Verify everything works fine

```bash
kubectl logs my-pod
```

Output:

```text
bar
```

## Cleanup

```bash
kubectl delete po,cm --all
```
