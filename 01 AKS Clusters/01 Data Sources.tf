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

#Data source for the Subnet which will host the AKS Cluster
data "azurerm_subnet" "AKSNoRBACSubnet" {
    name                    = "${var.AKSSubnet}"
    virtual_network_name    = "${data.azurerm_virtual_network.AKSVnet.name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}

#Data source for key vault

data "terraform_remote_state" "WS" {
    backend = "azurerm"
    workspace = "${terraform.workspace == "Prod" ? "Prod" : "Dev"}"
    config {
        storage_account_name = "${var.statestoa}"
        container_name       = "${var.statecontainer}"
        key                  = "${var.statekey}"
        access_key           = "${var.statestoakey}"
    }
}

/*
data "terraform_remote_state" "WSDev" {

    backend = "azurerm"
    workspace = "Dev"
    config {
    storage_account_name = "${var.statestoa}"
    container_name       = "${var.statecontainer}"
    key                  = "${var.statekey}"
    access_key           = "${var.statestoakey}"
    }
}

data "terraform_remote_state" "WSProd" {

    backend = "azurerm"
    workspace = "Prod"
    config {
    storage_account_name = "${var.statestoa}"
    container_name       = "${var.statecontainer}"
    key                  = "${var.statekey}"
    access_key           = "${var.statestoakey}"
    }
}

*/

data "azurerm_key_vault" "LabKeyVault" {
    name = "${data.terraform_remote_state.WS.KeyVault_Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
}


data "azurerm_key_vault_secret" "AKSSP_AppId" {
    name        = "${var.KeyVault_AKS_SP_AppId}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKSSP_AppSecret" {
    name        = "${var.KeyVault_AKS_SP_AppSecret}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppID" {
    name        = "${var.KeyVault_AKS_SRVAppId}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADServer_AppSecret" {
    name        = "${var.KeyVault_AKS_SRVAppSecret}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "AKS_AADClient_AppId" {
    name        = "${var.KeyVault_AKS_CliAppId}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}

data "azurerm_key_vault_secret" "SSHPublicKey" {
    name        = "${var.KeyVault_SSHPublicKey}"
    vault_uri = "${data.azurerm_key_vault.LabKeyVault.vault_uri}"
}


#Data source for log analytics workspace


data "azurerm_log_analytics_workspace" "AKSLabWS" {
    name = "${data.terraform_remote_state.WS.AKSWorkspace_Name}"
    resource_group_name     = "${data.azurerm_resource_group.InfraRG.name}"
    
}

