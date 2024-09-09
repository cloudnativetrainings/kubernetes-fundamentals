# Persistence with StorageClass

In the training, we will learn about Dynamic Persistence.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/12_persistence-dynamic
```

## Inspect storageclass-v1.yaml definition file and create the storageclass

```bash
cat storageclass-v1.yaml
kubectl create -f storageclass-v1.yaml
```

## Show the available storage classes

>Possibly there are standard ones.

```bash
kubectl get sc -o wide
```

## Inspect pvc.yaml definition file and create the pvc

```bash
cat pvc.yaml
kubectl create -f pvc.yaml
```

## Create a pod that consumes this pvc

The `volumeBindingMode` is set to `WaitForFirstConsumer`, meaning that the PV will not be created until a Pod asks for it:

```bash
cat pod.yaml
kubectl create -f pod.yaml
```

## Verify that a pv got created and its state

```bash
kubectl get pod,pvc,pv
```

## Delete the pvc and the pod

```bash
kubectl delete pod my-pod
kubectl delete pvc my-pvc
```

## Note that besides the pvc also the pv got deleted due to the `reclaimPolicy` of the storageclass

```bash
kubectl get pvc,pv
```

## Inspect storageclass-v2.yaml definition file and re-create the storageclass

```bash
cat storageclass-v2.yaml
kubectl replace -f storageclass-v2.yaml --force
```

## Inspect pvc.yaml definition file and re-create the pvc

```bash
cat pvc.yaml
kubectl create -f pvc.yaml
```

## Create a pod to consume PV

```bash
kubectl create -f pod.yaml
```

## Verify that a pv got created and its state again

```bash
kubectl get pod,pvc,pv
```

## Delete the pvc and the pod again

```bash
kubectl delete pod my-pod
kubectl delete pvc my-pvc
```

## Note that pv still exists due to the `reclaimPolicy` of the storageclass

```bash
kubectl get pvc,pv
```

## Cleanup

```bash
kubectl delete pv --all
kubectl delete sc my-storageclass
```
