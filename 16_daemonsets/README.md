# DaemonSets

In the training, we will learn about Daemonsets.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/16_daemonsets
```

## Inspect daemonset.yaml definition file and create the daemonset

```bash
cat daemonset.yaml
kubectl create -f daemonset.yaml
```

## Take a look at your Pods and Nodes

```bash
kubectl get po,no
```

>The number of pods for the daemonset has to match the number of nodes.

## Choose one Pod and take a look at its logging

```bash
kubectl logs <POD-NAME>
```

## Clean up

```bash
kubectl delete ds --all
```
