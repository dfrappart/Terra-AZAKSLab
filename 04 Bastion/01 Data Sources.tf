######################################################################
# Data source for underlying infrastructure
######################################################################

data "azurerm_subscription" "current" {}

#Data source for remote state hub

data "terraform_remote_state" "HubState" {
  backend   = "azurerm"
  config = {
    storage_account_name = var.statestoa
    container_name       = var.statecontainer
    key                  = var.statekey
    access_key           = var.statestoakey
  }
}




#Data source for RG containing the Vnet Hub

data "azurerm_resource_group" "RGHub" {
  name = data.terraform_remote_state.HubState.outputs.ResourceGroupHub_Name
}


#Data source for the Vnet Hub


data "azurerm_virtual_network" "VNetHub" {
  name                = data.terraform_remote_state.HubState.outputs.VNetHub_Name
  resource_group_name = data.azurerm_resource_group.RGHub.name
}


#Data source for the Bastion subnet

data "azurerm_subnet" "BastionSubnet" {
  name                    = data.terraform_remote_state.HubState.outputs.Bastion_Subnet_Name
  resource_group_name     = data.azurerm_resource_group.RGHub.name
  virtual_network_name    = data.azurerm_virtual_network.VNetHub.name
}


#Data source for the Bastion NSG

data "azurerm_network_security_group" "BastionNSG" {
  name                    = data.terraform_remote_state.HubState.outputs.Bastion_Subnet_NSG_Name
  resource_group_name     = data.azurerm_resource_group.RGHub.name

}




data "azurerm_resource_group" "KeyVaultRG" {
  name = data.terraform_remote_state.HubState.outputs.ResourceGroupKeyVault_Name
}

data "azurerm_key_vault" "Keyvault" {
  name                = data.terraform_remote_state.HubState.outputs.KeyVault_Name
  resource_group_name = data.azurerm_resource_group.KeyVaultRG.name
}

data "azurerm_key_vault_secret" "VMPassword" {
    name                        = data.terraform_remote_state.HubState.outputs.KeyVaultSecretWin_Name
    key_vault_id                = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_storage_account" "DiagSta" {
    name = data.terraform_remote_state.HubState.outputs.DiagStorageAccountName
    resource_group_name = data.terraform_remote_state.HubState.outputs.ResourceGroupLogs_Name
}
