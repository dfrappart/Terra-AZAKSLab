####################################################################
#This module allows the creation of a storage sharefile (Azure File)
####################################################################


output "Id" {
  value = azurerm_storage_share.Terra-AzureFile.id
}

output "URL" {
  value = azurerm_storage_share.Terra-AzureFile.url
}


