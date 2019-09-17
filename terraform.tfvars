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
VNet4Name             = "VNetSpoke3"
VNet4IPRange          = ["10.234.0.0/16"]

SubnetAddressRange = {
    "0" = "10.231.0.0/24"
    "1" = "10.231.1.0/24"
    "2" = "10.231.2.0/24"
    "3" = "10.231.3.0/24"
    "4" = "10.231.4.0/24"
    "5" = "10.232.0.0/20"
    "6" = "10.232.16.0/20"
    "7" = "10.233.0.0/20"
    "8" = "10.233.16.0/20"
    "9" = "10.234.0.0/24"
    "10" = "10.234.1.0/24"
    "11" = "10.234.2.0/24"

  }

SubnetName = {
    "0" = "ShareSVC_Subnet_Hub"
    "1" = "Bastion_Subnet_Hub"
    "2" = "AzureFirewallSubnet"
    "3" = "GatewaySubnet"
    "4" = "AzureBastionSubnet"
    "5" = "AKS_Subnet_Spoke1"
    "6" = "VirtualNode_Subnet_Spoke1"
    "7" = "AKS_Subnet_Spoke2"
    "8" = "VirtualNode_Subnet_Spoke2"
    "9" = "FE_Subnet_Spoke3"
    "10" = "BE_Subnet_Spoke3"
    "11" = "AppGW_Subnet_Spoke3"

  }



LAW                               = "SharedLAWWorkspace"
LogAnalyticsSolutionName          = "ContainerInsights"
LogAnalyticsSolutionPublisher     = "Microsoft"
LogAnalyticsSolutionProductName   = "OMSGallery/ContainerInsights"


EnvironmentTag      = "AKSLab"
EnvironmentUsageTag = "PoC"
OwnerTag            = "DF"
ProvisioningDateTag = "20190917"