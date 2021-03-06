######################################################
# Variables for Template
######################################################

# Variable to define the Azure Region

variable "AzureRegion" {
  type    = string
  default = "westeurope"
}


# Variable to define the Resource Group Name

variable "RGSpokeName" {
  type    = string
  description = "The resource group containing the spoke resources"

}


#Variable defining the vnet name

variable "VNetSpokeName" {
  type    = string
  description = "The name of the spoke VNet"

}

#Variable defining the vnet name

variable "VNetSpokeIPRange" {
  type    = list
  description = "The range of the spoke VNet"
  default = ["10.232.0.0/16"]

}

variable "SubnetName" {
  type = list
  default = [
    "AKSPool1_Subnet",
    "AKSPool2_Subnet",
    "AKSVirtualNode_Subnet"
  ]

}

variable "SubnetAddressRange" {
  type = list
  default = [
    "10.232.0.0/24",
    "10.232.1.0/24",
    "10.232.2.0/24"
  ]
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
  default = "stoarstatedf"

}

variable "statecontainer" {
  type    = string
  default = "terraform"

}

variable "statekey" {
  type    = string
  default = "LabAKSFoundationInfra.tf"

}

variable "statestoakey" {
  type    = string
  default = "mVVGQhDNUIJJpjw343As3++1a5GrEv9mc0F4HowaipxGfI4KbntPHpUnKQWvZ/W9mfni5sQnyfhXmaSSakGw5Q=="

}