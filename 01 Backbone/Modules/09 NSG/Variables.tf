##############################################################
#This module allows the creation of a Netsork Security Group
##############################################################

#Variable declaration for Module

variable "NSGName" {
  type    = string

}

variable "RGName" {
  type    = string

}

variable "NSGLocation" {
  type    = string
  default = "Westeurope"
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
  type    = string
  default = "That would be me"

}

variable "ProvisioningDateTag" {
  type    = string
  default = "Today :)"

}