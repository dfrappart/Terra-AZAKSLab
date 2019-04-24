######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = "string"
  default = "westeurope"
}


# Variable defining the RG containing the VNet

variable "RGInfraName" {
  type    = "string"

}

# Variable defining the RG containing the AKS Cluster

variable "RGAKSName" {
  type    = "string"

}
#Variable defining the vnet name


variable "AKSVNet" {
  type = "string"
}

#Variable defining the subnet name

variable "AKSSubnet" {
  type = "string"
}
/*
#Variable defining the key vault name
#not used, use the remote state as data source instead

variable "KeyVaultName" {
  type = "string"
}
*/


#Variable defining the keyvault secret  for the AKS SP App Id

variable "KeyVault_AKS_SP_AppId" {
  type = "string"
}

#Variable defining the keyvault secret  for the AKS SP App Secret

variable "KeyVault_AKS_SP_AppSecret" {
  type = "string"
}

#Variable defining the keyvault secret  for the AKS Server App Id 

variable "KeyVault_AKS_SRVAppId" {
  type = "string"
}

#Variable defining the keyvault secret  for the AKS Server App Secret

variable "KeyVault_AKS_SRVAppSecret" {
  type = "string"
}

#Variable defining the keyvault secret  for the AKS Client App Id

variable "KeyVault_AKS_CliAppId" {
  type = "string"
}

#Variable defining the keyvault secret  for the AKS Client App Id

variable "KeyVault_SSHPublicKey" {
  type = "string"
}

#Variable defining the Log analytics workspace for AKS
/*
#not used, use the remote state as data source instead
variable "AKSWorkspaceName" {
  type = "string"
}
*/

#Variable defining AKS Cluster

variable "AKSNodeCount" {
  type = "string"
  default = "3"
  description = "The initial number of nodes"
}

variable "AKSNodeInstanceType" {
  type = "string"
  default = "Standard_DS2_v2"
  description = "The instance type for the nodes"
}

variable "AKSNodeOSType" {
  type = "string"
  default = "Linux"
  description = "The OS on the nodes"
}

variable "AKSNodeOSDiskSize" {
  type = "string"
  default = "30"
  description = "The OS disk size"
}

variable "AKSMaxPods" {
  type = "string"
  default = "100"
  description = "The maximum number of pods per hosts"
}


variable "KubeVersion" {
  type = "string"
  default = "1.12.5"
}

variable "AKSDNSSVCIPModfier" {
  type = "string"
  default = "10"
}

variable "AKSDockerBridgeCIDR" {
  type = "string"
  default = "172.17.0.1/16"
}

variable "AKSSVCCIDR" {
  type = "string"
  default = "172.19.0.0/16"
}

variable "IshttproutingEnabled" {
  type = "string"
  default = true
}

variable "AKSAdminName" {
  type = "string"
  default = "AKSAdmin"
}


#Variable defining the AKS Cluster Name

variable "AKSClus" {
  type = "string"
}

#Tags definition

variable "EnvironmentTag" {
  type = "string"
}

variable "EnvironmentUsageTag" {
  type = "string"
}

variable "OwnerTag" {
  type = "string"
}

variable "ProvisioningDateTag" {
  type = "string"
}

variable "AKSSVCIPRange" {
  type = "string"
  default = "172.20.0.0/16"
}

variable "AKSDockerBridgeAddress" {
  type = "string"
  default = "172.17.0.1/16"
}

#######################################################################
#Variable for kube object creation


#ref for AAD Group, by object id
variable "AKSClusterAdminGroup" {
  type = "string"
  default = "546e2d3b-450e-4049-8f9c-423e1da3444c"
}

#ref for AAD Group, by object id
variable "AKSClusterAdminUSer" {
  type = "string"
  default = "david@teknews.cloud"
}