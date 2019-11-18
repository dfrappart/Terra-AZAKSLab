##############################################################
#This module allows the creation of a Subnet
##############################################################

#Variable declaration for Module

variable "SubnetName" {
  type    = string
  default = "DefaultSubnet"
}

variable "RGName" {
  type    = string
  default = "DefaultRSG"
}

variable "VNetName" {
  type = string
}

variable "Subnetaddressprefix" {
  type = string
}


variable "NSGId" {
  type = string
}



variable "SVCEP" {
  type    = list
  default = ["Microsoft.AzureCosmosDB", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.ServiceBus", "Microsoft.EventHub"]
}



