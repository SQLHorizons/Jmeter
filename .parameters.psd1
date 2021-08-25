@{
  ResourceGroup = "MC_k8s-aks-c01_k8s-aks-c01_uksouth"
  Container = @{
    name                  = "jmeter"
    registry              = "sqlhorizons.azurecr.io"
    username              = "00000000-0000-0000-0000-000000000000"
    image                 = "sqlhorizons.azurecr.io/ado.jmeter.agent:5.4.1"
    dns_name_label        = "aci-demo"
    ports                 = @(80)
    cpu                   = 1
    memory                = 0.5
  }
}
