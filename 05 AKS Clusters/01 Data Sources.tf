######################################################################
# Data source for underlying infrastructure
######################################################################

#Data source for remote state

data "terraform_remote_state" "Hub" {
  backend   = "azurerm"
  config    = {
    storage_account_name = var.statestoa
    container_name       = var.statecontainer
    key                  = var.statekey
    access_key           = var.statestoakey
  }
}

data "terraform_remote_state" "Spoke" {
  backend   = "azurerm"
  config    = {
    storage_account_name = var.statestoa
    container_name       = var.statecontainer
    key                  = var.statekeySpoke
    access_key           = var.statestoakey
  }
}

#Data source for RG containing the Vnet Hub

data "azurerm_resource_group" "InfraRG" {
  name = data.terraform_remote_state.Hub.outputs.ResourceGroupHub_Name
}

#Data source for RG containing the Vnet Spoke

data "azurerm_resource_group" "SpokeRG" {
  name = data.terraform_remote_state.Spoke.outputs.VNetSpokeRGName
}

#Data source for the VNet which will host the AKS Cluster
data "azurerm_virtual_network" "AKSVnet" {
  name                = data.terraform_remote_state.Spoke.outputs.VNetSpokeName
  resource_group_name = data.azurerm_resource_group.SpokeRG.name
}

#Data source for the AKS Subnet

data "azurerm_subnet" "AKSNodePool1Subnet" {
  name                 = data.terraform_remote_state.Spoke.outputs.AKS_SubnetNodePool1_Spoke1_Name
  virtual_network_name = data.azurerm_virtual_network.AKSVnet.name
  resource_group_name  = data.azurerm_resource_group.SpokeRG.name
}

data "azurerm_subnet" "AKSNodePool2Subnet" {
  name                 = data.terraform_remote_state.Spoke.outputs.AKS_SubnetNodePool2_Spoke1_Name
  virtual_network_name = data.azurerm_virtual_network.AKSVnet.name
  resource_group_name  = data.azurerm_resource_group.SpokeRG.name
}

data "azurerm_subnet" "AKSVirtualNodePoolSubnet" {
  name                 = data.terraform_remote_state.Spoke.outputs.AKSVirtualNodes_Subnet_Spoke1_Name
  virtual_network_name = data.azurerm_virtual_network.AKSVnet.name
  resource_group_name  = data.azurerm_resource_group.SpokeRG.name
}

#Data source for the keyvault

data "azurerm_resource_group" "KeyVaultRG" {
  name = data.terraform_remote_state.Hub.outputs.ResourceGroupKeyVault_Name
}

data "azurerm_key_vault" "Keyvault" {
  name                = data.terraform_remote_state.Hub.outputs.KeyVault_Name
  resource_group_name = data.azurerm_resource_group.KeyVaultRG.name
}

data "azurerm_key_vault_secret" "AKSSP_AppId" {
  name          = var.KeyVault_AKS_SP_AppId
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_key_vault_secret" "AKSSP_AppSecret" {
  name          = var.KeyVault_AKS_SP_AppSecret
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppID" {
  name          = var.KeyVault_AKS_SRVAppId
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppSecret" {
  name          = var.KeyVault_AKS_SRVAppSecret
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_key_vault_secret" "AKS_AADClient_AppId" {
  name          = var.KeyVault_AKS_CliAppId
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

data "azurerm_key_vault_secret" "SSHPublicKey" {
  name          = var.KeyVault_SSHPublicKey
  key_vault_id  = data.azurerm_key_vault.Keyvault.id
}

#Data source for log analytics workspace

data "azurerm_log_analytics_workspace" "AKSLabWS" {
  name                = data.terraform_remote_state.Hub.outputs.SharedLAWS_Name
  resource_group_name = data.azurerm_resource_group.InfraRG.name
}

