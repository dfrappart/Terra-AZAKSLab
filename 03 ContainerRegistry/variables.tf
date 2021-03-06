
variable "RGName" {
    type = string
}

variable "AzureRegion" {
    type = string
}

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

variable "ACRAdminAccountEnabled" {
    type = string
    default = false
}

variable "ACRSku" {
    type = string

}

variable "ACRReplicationList" {
    type = list
    default = ["northeurope","francecentral"]

}

#################################################################
# Variables for Azure Registration
#################################################################

variable "AzureSubscriptionID" {
  type    = string
}

variable "AzureClientID" {
  type    = string
}

variable "AzureObjectID" {
  type    = string
}

variable "AzureClientSecret" {
  type    = string

}

variable "AzureTenantID" {
  type    = string
}

#################################################################
#Remote State variable
#################################################################

variable "statestoa" {
  type    = string

}

variable "statecontainer" {
  type    = string

}

variable "statekey" {
  type    = string

}

variable "statestoakey" {
  type    = string

}