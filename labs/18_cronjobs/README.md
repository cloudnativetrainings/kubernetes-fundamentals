# CronJob

In this training course, we will create a job which will run every minute.

>Navigate to the lab folder:

```bash
cd /workspaces/kubernetes-fundamentals/labs/18_cronjobs
```

## Inspect cronjob.yaml definition file and create the cronjob

```bash
cat cronjob.yaml
kubectl create -f cronjob.yaml
```

## Take a look at running cronjobs and the pods

>It can take a while that the job is completed.

```bash
kubectl get cronjobs,pods
```

## Cleanup

```bash
kubectl delete cronjobs --all
```
