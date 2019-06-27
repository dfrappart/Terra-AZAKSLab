######################################################################
# This module create a keyvault resource
######################################################################



#Resource Creation

resource "azurerm_key_vault_access_policy" "TerraKeyVaultAP" {
  vault_name = "${var.VaultName}"
  resource_group_name = "${var.RGVaultName}"
  tenant_id = "${var.KeyVaultTenantId}"
  object_id = "${var.KeyVaultAPObjectId}"

  key_permissions = "${var.Keyperms}"

  secret_permissions = "${var.Secretperms}"

  certificate_permissions = "${var.Certperms}"

  storage_permissions = "${var.Storageperms}"

}

