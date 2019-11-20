#######################################################################
#Variable for kube object creation

#ref for AAD Group, by object id
variable "AKSClusterAdminGroup" {
  type    = string
  default = "546e2d3b-450e-4049-8f9c-423e1da3444c"
}

#ref for AAD Group, by object id
variable "AKSClusterAdminUSer" {
  type    = string
  default = "david@teknews.cloud"
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

