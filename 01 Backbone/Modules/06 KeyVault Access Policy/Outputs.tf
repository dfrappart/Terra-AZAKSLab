######################################################################
# This module create a keyvault secret
######################################################################



#Module Output

output "Id" {
  value = azurerm_key_vault_access_policy.TerraKeyVaultAP.id
}

output "KeyVaultId" {
  value = azurerm_key_vault_access_policy.TerraKeyVaultAP.key_vault_id
}