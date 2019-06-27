######################################################################
# Data source for underlying infrastructure
######################################################################

#Data source for RG containing the Vnet

data "azurerm_resource_group" "InfraRG" {
    name = "${var.RGName}"
}


#Data source for the VNet Hub
data "azurerm_virtual_network" "VNetHub" {
    name                    = "${var.VNet1Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}


#Data source for the VNet Spoke1
data "azurerm_virtual_network" "VNetSpoke1" {
    name                    = "${var.VNet2Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

#Data source for the VNet Spoke1
data "azurerm_virtual_network" "VNetSpoke2" {
    name                    = "${var.VNet3Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

#Data source for the VNet Spoke1
data "azurerm_virtual_network" "VNetSpoke3" {
    name                    = "${var.VNet4Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}