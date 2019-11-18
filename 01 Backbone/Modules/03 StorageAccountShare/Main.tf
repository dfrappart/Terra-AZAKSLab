####################################################################
#This module allows the creation of a storage sharefile (Azure File)
####################################################################


#Storage Share creation

resource azurerm_storage_share "Terra-AzureFile" {
  name                 = var.ShareName
  storage_account_name = var.StorageAccountName
  quota                = var.Quota
}

