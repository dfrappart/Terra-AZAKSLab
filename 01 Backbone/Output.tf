######################################################
# This file defines which value are sent to output
######################################################


######################################################
# Resource group Logs  Output

output "ResourceGroupLogs_Name" {
  value = module.ResourceGroupLogs.Name
}

output "ResourceGroupLogs_Id" {
  value = module.ResourceGroupLogs.Id
  sensitive = true
}

######################################################
# Resource group Files  Output

output "ResourceGroupFiles_Name" {
  value = module.ResourceGroupFiles.Name
}

output "ResourceGroupFiles_Id" {
  value = module.ResourceGroupFiles.Id
  sensitive = true
}

######################################################
# Diag & Log Storage account Info

output "DiagStorageAccountName" {
  value = module.DiagStorageAccount.Name
}

output "DiagStorageAccountID" {
  value = module.DiagStorageAccount.Id
  sensitive = true
}

output "DiagStorageAccountPrimaryBlobEP" {
  value = module.DiagStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "DiagStorageAccountPrimaryQueueEP" {
  value = module.DiagStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "DiagStorageAccountPrimaryTableEP" {
  value = module.DiagStorageAccount.PrimaryTableEP
  sensitive = true
}

output "DiagStorageAccountPrimaryFileEP" {
  value = module.DiagStorageAccount.PrimaryFileEP
  sensitive = true
}

output "DiagStorageAccountPrimaryAccessKey" {
  value = module.DiagStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "DiagStorageAccountSecondaryAccessKey" {
  value = module.DiagStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Files Storage account Info

output "FileStorageAccountName" {
  value = module.FileStorageAccount.Name
}

output "FileStorageAccountID" {
  value = module.FileStorageAccount.Id
  sensitive = true
}

output "FileStorageAccountPrimaryBlobEP" {
  value = module.FileStorageAccount.PrimaryBlobEP
  sensitive = true
}

output "FileStorageAccountPrimaryQueueEP" {
  value = module.FileStorageAccount.PrimaryQueueEP
  sensitive = true
}

output "FileStorageAccountPrimaryTableEP" {
  value = module.FileStorageAccount.PrimaryTableEP
  sensitive = true
}

output "FileStorageAccountPrimaryFileEP" {
  value = module.FileStorageAccount.PrimaryFileEP
  sensitive = true
}

output "FileStorageAccountPrimaryAccessKey" {
  value = module.FileStorageAccount.PrimaryAccessKey
  sensitive = true
}

output "FileStorageAccountSecondaryAccessKey" {
  value = module.FileStorageAccount.SecondaryAccessKey
  sensitive = true
}

######################################################
# Resource group Key Vault  Output

output "ResourceGroupKeyVault_Name" {
  value = module.ResourceGroupKeyVault.Name
}

output "ResourceGroupKeyVault_Id" {
  value = module.ResourceGroupKeyVault.Id
  sensitive = true
}



######################################################
# VNet Hub info Output

output "ResourceGroupHub_Name" {
  value = module.ResourceGroupHub.Name
}

output "ResourceGroupHub_Id" {
  value = module.ResourceGroupHub.Id
  sensitive = true
}

output "VNetHub_Name" {
  value = module.VNetHub.Name
}

output "VNetHub_Id" {
  value = module.VNetHub.Id
  sensitive = true
}

output "VNetHub_AddressSpace" {
  value = module.VNetHub.AddressSpace
  sensitive = true
}

######################################################
# Subnet Bastion info Output

output "Bastion_Subnet_Name" {
  value = module.Bastion_Subnet.Name
}

output "Bastion_Subnet_Id" {
  value = module.Bastion_Subnet.Id
  sensitive = true
}

output "Bastion_Subnet_AddressPrefix" {
  value = module.Bastion_Subnet.AddressPrefix
  sensitive = true
}

output "Bastion_Subnet_NSG_Name" {
  value = module.NSG_Bastion_Subnet.Name
}

output "Bastion_Subnet_NSG_Id" {
  value = module.NSG_Bastion_Subnet.Id
  sensitive = true
}


######################################################
# Subnet Share SVC info Output

output "ShareSVC_Subnet_Name" {
  value = module.ShareSVC_Subnet.Name
}

output "ShareSVC_Subnet_Id" {
  value = module.ShareSVC_Subnet.Id
  sensitive = true
}

output "ShareSVC_Subnet_AddressPrefix" {
  value = module.ShareSVC_Subnet.AddressPrefix
  sensitive = true
}

output "ShareSVC_Subnett_NSG_Name" {
  value = module.NSG_ShareSVC_Subnet.Name
}

output "ShareSVC_Subnett_NSG_Id" {
  value = module.NSG_ShareSVC_Subnet.Id
  sensitive = true
}


######################################################
# Subnet Managed Bastion info Output

output "ManagedBastion_Subnet_Name" {
  value = module.ManagedBastion_Subnet.Name
}

output "ManagedBastion_Subnett_Id" {
  value = module.ManagedBastion_Subnet.Id
  sensitive = true
}

output "ManagedBastion_Subnet_AddressPrefix" {
  value = module.ManagedBastion_Subnet.AddressPrefix
  sensitive = true
}

######################################################
# Subnet Gateway info Output

output "GW_Subnet_Name" {
  value = module.GW_Subnet.Name
}

output "GW_Subnet_Id" {
  value = module.GW_Subnet.Id
  sensitive = true
}

output "GW_Subnet_AddressPrefix" {
  value = module.GW_Subnet.AddressPrefix
  sensitive = true
}

######################################################
# Subnet Gateway info Output

output "FW_Subnett_Name" {
  value = module.FW_Subnet.Name
}

output "FW_Subnet_Id" {
  value = module.FW_Subnet.Id
  sensitive = true
}

output "FW_Subnet_AddressPrefix" {
  value = module.FW_Subnet.AddressPrefix
  sensitive = true
}


######################################################
# KeyVault info Output

output "KeyVault_Name" {
  value = module.KeyVault.Name
  sensitive = true
}

output "KeyVault_Id" {
  value = module.KeyVault.Id
  sensitive = true
}

######################################################
# KeyVault Secret WinVMPassword info Output

output "KeyVaultSecretWin_Name" {
  value = module.StoringWinDefaultPWDInVault.Name

}

output "KeyVaultSecretWin_Id" {
  value = module.StoringWinDefaultPWDInVault.Id
  sensitive = true
}

output "KeyVaultSecretWin_Version" {
  value = module.StoringWinDefaultPWDInVault.Version
  sensitive = true
}

######################################################
# KeyVault Secret AKSAADServerAppId info Output

output "KeyVaultSecretAKSAADServerAppId_Name" {
  value = module.StoringAKSAADServerAppIdInKeyVault.Name

}

output "KeyVaultSecretAKSAADServerAppId_Id" {
  value = module.StoringAKSAADServerAppIdInKeyVault.Id
  sensitive = true
}

output "KeyVaultSecretAKSAADServerAppId_Version" {
  value = module.StoringAKSAADServerAppIdInKeyVault.Version
  sensitive = true
}

######################################################
# KeyVault Secret AKSAADServer Secret info Output

output "KeyVaultSecretAKSAADServerAppSecret_Name" {
  value = module.StoringAKSAADServerAppSecretInKeyVault.Name

}

output "KeyVaultSecretAKSAADServerAppSecret_Id" {
  value = module.StoringAKSAADServerAppSecretInKeyVault.Id
  sensitive = true
}

output "KeyVaultSecretAKSAADServerAppSecret_Version" {
  value = module.StoringAKSAADServerAppSecretInKeyVault.Version
  sensitive = true
}

######################################################
# KeyVault Secret AKSAADClient Id info Output

output "KeyVaultSecretAKSAADClientAppId_Name" {
  value = module.StoringAKSAADClientAppIdInVault.Name

}

output "KeyVaultSecretAKSAADClientAppId_Id" {
  value = module.StoringAKSAADClientAppIdInVault.Id
  sensitive = true
}

output "KeyVaultSecretAKSAADClientAppId_Version" {
  value = module.StoringAKSAADClientAppIdInVault.Version
  sensitive = true
}

######################################################
# KeyVault Secret AKS App Id info Output

output "KeyVaultSecretAKSSPAppId_Name" {
  value = module.StoringAKSSPAppIdInVault.Name

}

output "KeyVaultSecretAKSSPAppId_Id" {
  value = module.StoringAKSSPAppIdInVault.Id
  sensitive = true
}

output "KeyVaultSecretAKSSPAppId_Version" {
  value = module.StoringAKSSPAppIdInVault.Version
  sensitive = true
}

######################################################
# KeyVault Secret AKS App Secret info Output

output "KeyVaultSecretAKSSPSecret_Name" {
  value = module.StoringAKSSPSecretInVault.Name

}

output "KeyVaultSecretAKSSPSecret_Id" {
  value = module.StoringAKSSPSecretInVault.Id
  sensitive = true
}

output "KeyVaultSecretAKSSPSecret_Version" {
  value = module.StoringAKSSPSecretInVault.Version
  sensitive = true
}

######################################################
#Output for the Log Analytics Workspace module

output "SharedLAWS_Name" {
  value = module.SharedLAWS.Name
}

output "SharedLAWS_Location" {
  value = module.SharedLAWS.Location
}

output "SharedLAWS_RG" {
  value = module.SharedLAWS.RG
}

output "SharedLAWS_Sku" {
  value = module.SharedLAWS.Sku
}

output "SharedLAWS_Id" {
  value = module.SharedLAWS.Id
  sensitive = true
}

output "SharedLAWS_PSK" {
  value = module.SharedLAWS.PSK
  sensitive = true
}

output "SharedLAWS_SSK" {
  value = module.SharedLAWS.SSK
  sensitive = true
}

output "SharedLAWS_WSId" {
  value = module.SharedLAWS.WSId
  sensitive = true
}

output "SharedLAWS_PortalUrl" {
  value = module.SharedLAWS.PortalUrl
}



