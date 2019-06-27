######################################################
# This file configure the AzureRm provider
######################################################

######################################################################
# Access to Azure
######################################################################

# Configure the Microsoft Azure Provider with Azure provider variable defined in AzureDFProvider.tf

provider "azurerm" {
  subscription_id = terraform.workspace == "Prod" ? var.AzureSubscriptionMVPSponsor : var.AzureSubscriptionMVPMSDN
  client_id       = var.AzureClientID
  client_secret   = var.AzureClientSecret
  tenant_id       = var.AzureTenantID
}

