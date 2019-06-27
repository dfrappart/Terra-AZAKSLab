######################################################################
# This module create a keyvault secret
######################################################################



#Module Output

output "Id" {
  value = "${azurerm_key_vault_access_policy.TerraKeyVaultAP.id}"
}

