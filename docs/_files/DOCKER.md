# docker file

## Reference

- [Create a private container registry](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-azure-cli)

```powershell
$AzAccount = az login --tenant $($env:TenantId)

##  create a container registry.
$ACR = az acr create `
  --name sqlhorizons `
  --resource-group MC_k8s-aks-c01_k8s-aks-c01_uksouth `
  --admin-enabled true `
  --zone-redundancy Disabled `
  --sku Basic
##  az acr delete -n sqlhorizons --yes

##  log in to registry.
$TOKEN = $(az acr login `
  --name sqlhorizons `
  --expose-token) | ConvertFrom-Json

##  manual login using the provided access token
clear; $($TOKEN.accessToken) | docker login `
  $($TOKEN.loginServer) `
  --username 00000000-0000-0000-0000-000000000000 `
  --password-stdin

##  build docker image.
clear; docker build . `
  --file .dockerfile `
  --no-cache=false `
  --build-arg VERSION=$(cat version.txt) `
  --tag ado.jmeter.agent:$(cat version.txt)

##  tag the image using the docker tag.
docker tag ado.jmeter.agent:$(cat version.txt) "$($TOKEN.loginServer)/ado.jmeter.agent:$(cat version.txt)"

##  list docker image.
docker image ls "*/ado.jmeter.agent:$(cat version.txt)"

##  scan docker image.
docker scan "$($TOKEN.loginServer)/ado.jmeter.agent:$(cat version.txt)" --accept-license

##  push the image to the registry instance.
docker push "$($TOKEN.loginServer)/ado.jmeter.agent:$(cat version.txt)"

##  list container images.
az acr repository list `
  --name sqlhorizons `
  --output table

##  deleate docker image.
docker rmi ado.jmeter.agent:$(cat version.txt)
docker rmi "$($TOKEN.loginServer)/ado.jmeter.agent:$(cat version.txt)"
```
