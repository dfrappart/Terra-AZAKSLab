######################################################################
# This module create a keyvault resource
######################################################################

#Variable declaration for Module

variable "KeyVaultName" {
  type = string
}

variable "KeyVaultLocation" {
  type    = string
  default = "westeurope"
}

variable "KeyVaultRG" {
  type = string
}

variable "KeyVaultSKUName" {
  type    = string
  default = "standard"
}

/*
variable "KeyVaultObjectIDPolicy1" {
  type = string
}

variable "KeyVaultObjectIDPolicy2" {
  type = string
}

*/

variable "KeyVaultTenantID" {
  type = string
}
/*
variable "KeyVaultApplicationID" {
  type = string
}
*/

variable "KeyVaultEnabledforDeployment" {
  type    = string
  default = "true"
}

variable "KeyVaultEnabledforDiskEncrypt" {
  type    = string
  default = "true"
}

variable "KeyVaultEnabledforTempDeploy" {
  type    = string
  default = "true"
}




variable "EnvironmentTag" {
  type    = string
  default = "Poc"
}

variable "EnvironmentUsageTag" {
  type    = string
  default = "Poc usage only"
}

variable "OwnerTag" {
  type = string
  default = "david@teknews.cloud"
}

variable "ProvisioningDateTag" {
  type = string
  default = "Today :)"
}