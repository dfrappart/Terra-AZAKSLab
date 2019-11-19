
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