# Jmeter

Basic deployment  instructions for use when developing changes to the repository and testing before committing to remote.

## Deployment kustomize

```powershell
clear; $Project = "C:\Data\.seng\Jmeter\deployments\Jmeter"
$NAMESPACE = "Jmeter"
Push-Location $Project

##  kubectl kustomize $Project
clear; kubectl apply --kustomize $Project
##  kubectl delete --kustomize $Project
##  kubectl get pvc -n ${NAMESPACE} --output wide
```

## disable flux

```powershell
##  if we want to suspend flux for Jmeter, then below are the two things we have to edit.
kubectl edit ks environments-apps-xray -n flux
kubectl edit ks flux-fleet -n flux-system
```
