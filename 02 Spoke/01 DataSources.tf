######################################################################
# Data source for underlying infrastructure
######################################################################

######################################################################
# Data source for underlying infrastructure
######################################################################

#Data source for remote state

data "terraform_remote_state" "HubState" {
  backend   = "azurerm"
  config = {
    storage_account_name = var.statestoa
    container_name       = var.statecontainer
    key                  = var.statekey
    access_key           = var.statestoakey
  }
}

#Data source for RG containing the Vnets

data "azurerm_resource_group" "RGHub" {
  name = data.terraform_remote_state.HubState.outputs.ResourceGroupHub_Name
}

#Data source for the VNet Hub
data "azurerm_virtual_network" "VNetHub" {
  name                = data.terraform_remote_state.HubState.outputs.VNetHub_Name
  resource_group_name = data.azurerm_resource_group.RGHub.name
}