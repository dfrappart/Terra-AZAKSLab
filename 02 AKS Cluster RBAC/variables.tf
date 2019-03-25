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

#Variable defining the key vault name

variable "KeyVaultName" {
  type = "string"
}

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

variable "AKSWorkspaceName" {
  type = "string"
}

#Variable defining the AKS Cluster Name

variable "AKSClusterwithRBACName" {
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