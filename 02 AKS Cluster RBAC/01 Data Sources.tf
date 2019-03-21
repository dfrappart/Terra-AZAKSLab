######################################################################
# Data source for underlying infrastructure
######################################################################

#Data source for RG containing the Vnet

data "azurerm_resource_group" "InfraRG" {
    name = "${var.RGInfraName}"
}

data "azurerm_resource_group" "AKSRG" {
    name = "${var.RGAKSName}"
}

#Data source for the VNet which will host the AKS Cluster
data "azurerm_virtual_network" "AKSVnet" {
    name                    = "${var.AKSVNet}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

#Data source for the Subnet which will host the AKS Cluster
data "azurerm_subnet" "AKSwithRBACSubnet" {
    name                    = "${var.AKSSubnet}"
    virtual_network_name    = "${data.azurerm_virtual_network.AKSVnet.name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

#Data source for key vault



data "azurerm_key_vault" "LabKeyVault" {
    name                    = "${var.KeyVaultName}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

data "azurerm_key_vault_secret" "AKSSP_AppId" {
    name        = "${var.KeyVault_AKS_SP_AppId}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKSSP_AppSecret" {
    name        = "${var.KeyVault_AKS_SP_AppSecret}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppID" {
    name        = "${var.KeyVault_AKS_SRVAppId}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppSecret" {
    name        = "${var.KeyVault_AKS_SRVAppSecret}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADClient_AppId" {
    name        = "${var.KeyVault_AKS_CliAppId}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "SSHPublicKey" {
    name        = "${var.KeyVault_SSHPublicKey}"
    vault_uri   = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_log_analytics_workspace" "AKSLabWS" {
    name                    = "${var.AKSWorkspaceName}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}