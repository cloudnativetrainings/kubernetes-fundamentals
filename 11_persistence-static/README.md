# Persistence without StorageClass

In the training, we will learn about Static Persistence.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/11_persistence-static
```

## Inspect pv.yaml definition file and create the pv

```bash
cat pv.yaml
kubectl create -f pv.yaml
```

## Inspect pvc.yaml definition file and create the pvc

```bash
cat pvc.yaml
kubectl create -f pvc.yaml
```

>There are some issues with this structure. Try to fix these erros and verify via `kubectl get pv,pvc`. You are finished when yhour pvc is in state `Bound`

```bash
kubectl get pv,pvc
```

## Cleanup

```bash
kubectl delete pvc my-pvc
kubectl delete pv my-pv
```
