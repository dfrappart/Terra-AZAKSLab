######################################################################
# This file references the VM B sizes
######################################################################

RGName                = "RG_Infra"
RGBastionName         = "RG_Bastion"
RGAKSName             = "RG_AKSManagedCluster"
AzureRegion           = "westeurope"
VNet1Name             = "VNetHub"
VNet1IPRange          = ["10.231.0.0/16"]
VNet2Name             = "VNetSpoke1"
VNet2IPRange          = ["10.232.0.0/16"]
VNet3Name             = "VNetSpoke2"
VNet3IPRange          = ["10.233.0.0/16"]

SubnetAddressRange = {
    "0" = "10.231.0.0/24"
    "1" = "10.231.1.0/24"
    "2" = "10.231.2.0/24"
    "3" = "10.231.3.0/24"
    "4" = "10.232.0.0/20"
    "5" = "10.233.0.0/24"
    "6" = "10.233.1.0/24"
    "7" = "10.233.2.0/24"
    "8" = "10.232.16.0/20"
  }

SubnetName = {
    "0" = "ShareSVC_Subnet"
    "1" = "Bastion_Subnet"
    "2" = "AzureFirewallSubnet"
    "3" = "GatewaySubnet"
    "4" = "AKS_Subnet"
    "5" = "AppGW_Subnet"
    "6" = "FE_Subnet"
    "7" = "BE_Subnet"
    "8" = "AKS_Subnet2"
  }

AKSName                           = "AKSLabCluster"
AKSwithRBACName                   = "AKSLabClusterRBAC"
AKSWorkspaceName                  = "AKSWorkspace"
LogAnalyticsSolutionName          = "ContainerInsights"
LogAnalyticsSolutionPublisher     = "Microsoft"
LogAnalyticsSolutionProductName   = "OMSGallery/ContainerInsights"

EnvironmentTag      = "AKSLab"
EnvironmentUsageTag = "PoC"
OwnerTag            = "DF"
ProvisioningDateTag = "20190315"