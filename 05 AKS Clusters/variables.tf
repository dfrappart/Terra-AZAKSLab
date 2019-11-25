######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = string
  default = "westeurope"
}


# Variable defining the RG containing the AKS Cluster

variable "RGAKSName" {
  type = string
}



#Variable defining the keyvault secret  for the AKS SP App Id

variable "KeyVault_AKS_SP_AppId" {
  type = string
}

#Variable defining the keyvault secret  for the AKS SP App Secret

variable "KeyVault_AKS_SP_AppSecret" {
  type = string
}

#Variable defining the keyvault secret  for the AKS Server App Id 

variable "KeyVault_AKS_SRVAppId" {
  type = string
}

#Variable defining the keyvault secret  for the AKS Server App Secret

variable "KeyVault_AKS_SRVAppSecret" {
  type = string
}

#Variable defining the keyvault secret  for the AKS Client App Id

variable "KeyVault_AKS_CliAppId" {
  type = string
}

#Variable defining the keyvault secret  for the AKS Client App Id

variable "KeyVault_SSHPublicKey" {
  type = string
}



#Variable defining AKS Cluster

variable "AKSNodeCount" {
  type        = string
  default     = "3"
  description = "The initial number of nodes"
}

variable "AKSNodeInstanceType" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "The instance type for the nodes"
}

variable "AKSNodeOSType" {
  type        = string
  default     = "Linux"
  description = "The OS on the nodes"
}

variable "AKSNodeOSDiskSize" {
  type        = string
  default     = "30"
  description = "The OS disk size"
}

variable "AKSMaxPods" {
  type        = string
  default     = "100"
  description = "The maximum number of pods per hosts"
}

variable "KubeVersion" {
  type    = string
  default = "1.14.8"
}

variable "AKSDNSSVCIPModfier" {
  type    = string
  default = "10"
}

variable "AKSDockerBridgeCIDR" {
  type    = string
  default = "172.17.0.1/16"
}

variable "AKSSVCCIDR" {
  type    = string
  default = "172.19.0.0/16"
}

variable "IshttproutingEnabled" {
  type    = string
  default = true
}

variable "AKSAdminName" {
  type    = string
  default = "AKSAdmin"
}

variable "AKSAZ" {
  type = list
  description = "The list of AZ in which the nodes deploy"

}

variable "EnablePodPolicy" {
  type    = string
  default = true
  description = "Define if pod policy is activated"
}

variable "AKSNodesRG" {
  type    = string
  default = "RGAKSNodePool1"
}

variable "AKSNodePoolType" {
  type    = string
  default = "VirtualMachineScaleSets"
  description = "Define the type of node pool for scaling. By default scaleset to allow autoscaling"
}

variable "AKSLBSku" {
  type    = string
  default = "standard"
  description = "the sku of the lb use with AKS"
}

variable "EnableAKSAutoScale" {
  type    = string
  default = true
  description = "Activate the autoscaling on the AKS cluster, requires vmscaleset"
}

variable "MinAutoScaleCount" {
  type    = string
  default = 1
  description = "The min number of nodes"

}

variable "MaxAutoScaleCount" {
  type    = string
  default = 6
  description = "The max number of nodes"
}

variable "IsOMSAgentEnabled" {
  type    = string
  default = true
  description = "Activate Log analytics workspace"
}

#Variable defining the AKS Cluster Name

variable "AKSClus" {
  type = string
}

#Tags definition

variable "EnvironmentTag" {
  type = string
}

variable "EnvironmentUsageTag" {
  type = string
}

variable "OwnerTag" {
  type = string
}

variable "ProvisioningDateTag" {
  type = string
}

#########################################################################
#Secret Section

#######################################################################
#Variable for kube object creation

#ref for AAD Group, by object id
variable "AKSClusterAdminGroup" {
  type    = string

}

#ref for AAD Group, by object id
variable "AKSClusterAdminUSer" {
  type    = string

}

#ref for AAD Group, by object id
variable "AKSClusterAdminUSer2" {
  type    = string

}

#################################################################
# Provider Config
#################################################################


variable "AzureSubscriptionID" {
  type    = string
  description = "The Subscription id required for the provider authentication"
}

variable "AzureClientID" {
  type    = string
  default = "The Azure AD ID used by terraform on the subscription"
}


variable "AzureClientSecret" {
  type    = string
  default = "The Azure AD secret used by terraform for authentication"

}

variable "AzureTenantID" {
  type    = string
  default = "The Azure AD Tenant ID"
}

##############################################
#Variable for using state as a data source

variable "statestoa" {
  type    = string
  description = "the name of the storage account storing the state of the 02 automation setup configuration"
}

variable "statecontainer" {
  type    = string
  description = "The name of the container in which the state is stored"
}

variable "statestoakey" {
  type    = string
  description = "The storage access key of the storage account"
}

variable "statekey" {
  type    = string
  default = "hubsetup.tfstate"
  description = "the name of the file containing the state of the 02 Hub configuration"
}

variable "statekeySpoke" {
  type    = string
  description = "The name of the file containing the state of the key vault"
}
