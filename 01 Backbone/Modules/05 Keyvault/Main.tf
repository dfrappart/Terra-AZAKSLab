######################################################################
# This module create a keyvault resource
######################################################################

#Resource Creation

resource "azurerm_key_vault" "TerraKeyVault" {
  name                = lower(var.KeyVaultName)
  location            = var.KeyVaultLocation
  resource_group_name = var.KeyVaultRG

  sku_name = var.KeyVaultSKUName

  tenant_id = var.KeyVaultTenantID



  ########################
  #Others Keyvault param

  enabled_for_deployment          = var.KeyVaultEnabledforDeployment
  enabled_for_disk_encryption     = var.KeyVaultEnabledforDiskEncrypt
  enabled_for_template_deployment = var.KeyVaultEnabledforTempDeploy

  ########################
  #Tags

    tags = {
    Environment         = var.EnvironmentTag
    Usage               = var.EnvironmentUsageTag
    Owner               = var.OwnerTag
    ProvisioningDate    = var.ProvisioningDateTag
    }
}


