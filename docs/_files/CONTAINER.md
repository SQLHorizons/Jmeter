# container

## Reference

- [Create a private container registry](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-azure-cli)
- [Start, Stop, Delete and Monitor Azure Container](https://www.mssqltips.com/sqlservertip/6251/start-stop-delete-and-monitor-azure-container-instances-for-sql-server/)

```powershell
$AzAccount = az login --tenant $($env:TenantId)

##  log in to registry.
$TOKEN = $(az acr login `
  --name sqlhorizons `
  --expose-token) | ConvertFrom-Json

##  list container images.
az acr repository list `
  --name sqlhorizons `
  --output table

##  load project parameters.
$params = Import-PowerShellDataFile -Path ".parameters.psd1"

##  create container.
clear; az container create `
  --resource-group           $($params.ResourceGroup) `
  --name                     $($params.Container.name) `
  --registry-username        $($params.Container.username) `
  --registry-password        $($TOKEN.accessToken) `
  --image                    $($params.Container.image) `
  --dns-name-label           $($params.Container.dns_name_label) `
  --ports                    $($params.Container.ports) `
  --cpu                      $($params.Container.cpu) `
  --memory                   $($params.Container.memory)
##  az container delete -n $($params.Container.name) -g $($params.ResourceGroup) -y

##  show containers.
az container show `
  --resource-group $($params.ResourceGroup) `
  --name $($params.Container.name)

az container list `
  --resource-group $($params.ResourceGroup) `
  --output table

```
