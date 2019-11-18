##############################################################
#This module allows the creation of an AzureRM FW
##############################################################


# FW Public IP

resource "random_string" "FWIPRandomstring" {



    length      = "4"
    special     = false
    upper       = false
    number      = true

}

resource "azurerm_public_ip" "TerraZRPIPFW" {
  name                         = "${var.FWName}PublicIp"
  location                     = "${var.FWLocation}"
  resource_group_name          = "${var.RGName}"
  #public_ip_address_allocation = "static" changed for allocation_method
  allocation_method            = "Static"
  sku                          = "standard"
  domain_name_label            = "${lower(var.EnvironmentTag)}${lower(var.FWName)}${lower(terraform.workspace)}${random_string.FWIPRandomstring.result}"


  tags = {
    Environment       = "${var.EnvironmentTag}"
    Usage             = "${var.EnvironmentUsageTag}"
    Owner             = "${var.OwnerTag}"
    ProvisioningDate  = "${var.ProvisioningDateTag}"
  }
}

# FW creation

resource "azurerm_firewall" "TerraFirewall" {
  name                          = "${var.FWName}"
  location                      = "${var.FWLocation}"
  resource_group_name           = "${var.RGName}"

  ip_configuration {
    name                          = "${var.FWName}${var.FWIPConfigName}"
    subnet_id                     = "${var.FWSubnetId}"
    internal_public_ip_address_id = "${azurerm_public_ip.TerraZRPIPFW.id}"
  }

    tags = {
    Environment         = "${var.EnvironmentTag}"
    Usage               = "${var.EnvironmentUsageTag}"
    Owner               = "${var.OwnerTag}"
    ProvisioningDate    = "${var.ProvisioningDateTag}"
    }
}

