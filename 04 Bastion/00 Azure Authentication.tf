######################################################
# This file configure the AzureRm provider
######################################################

######################################################################
# Access to Azure
######################################################################

# Configure the Microsoft Azure Provider with Azure provider variable defined in AzureDFProvider.tf

provider "azurerm" {
  subscription_id = var.AzureSubscriptionID
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenantID
}

/*
provider "azurerm" {
  subscription_id = var.AzureSubscriptionID2
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenantID
  alias           = "SpokeSub"
}
*/