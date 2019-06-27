######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = "string"
  default = "westeurope"
}


# Variable to define the Resource Group Name

variable "RGName" {
  type    = "string"

}


#Variable defining the vnet name

variable "VNet1Name" {
  type    = "string"

}

variable "VNet2Name" {
  type    = "string"

}

variable "VNet3Name" {
  type    = "string"

}

variable "VNet4Name" {
  type    = "string"

}


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

