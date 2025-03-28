# Setup

Load Key file to K8S Secret
```
cd mock-certs

./create-secret.sh
```

Step setup cronjob
```bash
kubectl apply -f key2pfx.pvc.yml
kubectl apply -f key2pfx.cronjob.yml
```

Step run manual job 
```bash
kubectl apply -f key2pfx.job.yml
```

Step run  manual job again

```bash
kubectl delete -f  key2pfx.job.yml
kubectl apply -f  key2pfx.job.yml
```


Example Using PFX

```bash
 kubectl apply -f key2pfx-example.deployment.yml 
```

```bash
kubectl exec -it key2pfx-example-<deployment generated code> -- bash
```

```
cd /https
```

# Cleanup
```bash
kubectl delete -f .
```